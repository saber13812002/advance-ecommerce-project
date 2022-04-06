<?php


namespace App\Repositories;


use App\Http\Resources\CustomCouponResource;
use App\Interfaces\Repositories\CouponRepository;
use App\Models\Coupon;
use Carbon\Carbon;

class CouponRepositoryImpl implements CouponRepository
{

    public function index()
    {
        // TODO: Implement index() method.
    }

    public function show(int $couponId)
    {
        return Coupon::query()
            ->findOrFail($couponId);
    }

    public function query($request, $couponName)
    {
        if (!$request->product_id) {
            abort("404", trans("coupon.coupon_not_found"));
        }

        $modelId = $request->product_id;
        $modelName = "App/Product";

        $entry = Coupon::query()
            ->whereModelId($modelId)
            ->whereModelName($modelName)
            ->whereCouponName($couponName)
            ->firstOrFail();


        if (!($entry->started_at && $entry->expired_at)) {
            abort("404", trans("coupon.coupon_not_found"));
        }

        $today = Carbon::now();
        $started_at = Carbon::parse($entry->started_at);
        $expired_at = Carbon::parse($entry->expired_at);

        $result = $expired_at->lt($today);
        if ($result) {
            abort("404", trans("coupon.coupon_expired"));
        }

        $result = $today->lte($started_at);
        if ($result) {
            abort("404", trans("coupon.campaign_not_started"));
        }

        $entry->product_id = request()->product_id;
        return response(new CustomCouponResource(['data' => $entry], true));
    }
}
