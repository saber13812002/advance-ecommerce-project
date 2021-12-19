<?php

namespace App\Services;

use App\Coupon;
use App\CouponUser;
use App\Exceptions\ClientException;
use App\Exceptions\InvalidCouponException;
use App\Payment;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use Throwable;

class CouponService
{
    /**
     * @throws InvalidCouponException
     */
    public static function checkCoupon(
        string $code,
        float $price,
        int $packageId,
        int $userId,
        int $appId = 0
    ): array {
        $coupon = Coupon::where('code', strtoupper($code))
            ->where('app_id', $appId)
            ->first();

        if (is_null($coupon)) {
            return self::couponError('کد تخفیف اشتباه است.');
        }

        if (!$coupon->isActive()) {
            return self::couponError('کد تخفیف غیر فعال است.');
        }

        if ($coupon->times <= 0) {
            return self::couponError('تعداد دفعات استفاده از کد تخفیف به پایان رسیده است.');
        }

        if (!empty($coupon->started_at) && now()->toDateString() < $coupon->started_at) {
            return self::couponError('زمان استفاده از کد تخفیف هنوز آغاز نشده است.');
        }

        if (!empty($coupon->expired_at) && now()->toDateString() > $coupon->expired_at) {
            return self::couponError('زمان استفاده از کد تخفیف به پایان رسیده است.');
        }

        if ($coupon->isForFirstBuy() && Payment::appId($appId)->userId($userId)->verified()->exists()) {
            return self::couponError('کد تخفیف فقط برای اولین خرید قابل استفاده است.');
        }

        if ($coupon->users()->count() !== 0 && $coupon->users()->where('user_id', $userId)->count() === 0) {
            return self::couponError('این کد تخفیف برای شما فعال نیست.');
        }

        if ($coupon->packages()->count() !== 0 && $coupon->packages()->where('package_id', $packageId)->count() === 0) {
            return self::couponError('کد تخفیف با محصول انتخابی تطابق ندارد.');
        }

        if ($coupon->isPercent()) {
            $discount = $price * ($coupon->value / 100);
        } else {
            $discount = (float) $coupon->value;
        }

        $finalPrice = $price - $discount;
        $finalPrice = ($finalPrice < 0) ? 0 : $finalPrice;

        return ['coupon_id' => $coupon->id, 'final' => $finalPrice, 'discount' => $discount];
    }

    public static function useCoupon(Payment $payment): void
    {
        if ($payment->hasCoupon()) {
            Coupon::where('id', $payment->coupon_id)->decrement('times', 1, [
                'is_used' => true
            ]);
        }
    }

    /**
     * @throws ClientException
     */
    public static function storeRandomCoupon(int $userId, int $appId, string $prefix = '')
    {
        while (true) {
            $code = self::generateCode(random_int(4, 8), $prefix);

            if (!Coupon::appIdCode($appId, $code)->exists()) {
                break;
            }
        }

        $value = self::getRandomPercentValue();

        try {
            DB::beginTransaction();

            $coupon = Coupon::create([
                'app_id' => $appId,
                'coupon_type_id' => Coupon::TYPES['PERCENT'],
                'code' => $code,
                'value' => $value,
                'started_at' => now()->toDateString(),
                'expired_at' => now()->addWeek()->toDateString(),
                'is_autogenic' => true
            ]);

            CouponUser::create([
                'user_id' => $userId,
                'coupon_id' => $coupon->id
            ]);

            DB::commit();

            return $coupon;
        } catch (Throwable $ex) {
            DB::rollBack();

            throw new ClientException('خطا در ایجاد کد تخفیف.', Response::HTTP_BAD_REQUEST);
        }
    }

    public static function generateCode(int $length = 6, string $prefix = '', string $suffix = ''): string
    {
        if ($length > 0) {
            $code = $prefix.self::generateRandomString($length).$suffix;
        } else {
            $code = $prefix.$suffix;
        }

        return strtoupper($code);
    }

    private static function getRandomPercentValue(): int
    {
        $random = random_int(0, 99999);

        if ($random <= 49999) {
            return 10;
        }

        if ($random <= 89999) {
            return 20;
        }

        if ($random <= 96999) {
            return 30;
        }

        if ($random <= 99987) {
            return 40;
        }

        if ($random <= 99990) {
            return 50;
        }

        if ($random <= 99993) {
            return 60;
        }

        if ($random <= 99995) {
            return 70;
        }

        if ($random <= 99997) {
            return 80;
        }

        if ($random <= 99998) {
            return 90;
        }

        return 100;
    }

    private static function generateRandomString(int $length)
    {
        $pool = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';

        return substr(str_shuffle(str_repeat($pool, 5)), 0, $length);
    }

    /**
     * @throws InvalidCouponException
     */
    public static function couponError(string $errorMessage): array
    {
        throw new InvalidCouponException($errorMessage);
    }
}
