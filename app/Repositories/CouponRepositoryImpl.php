<?php


namespace App\Repositories;


use App\Http\Resources\CouponResource;
use App\Interfaces\Repositories\CouponRepository;
use App\Models\Coupon;
use Carbon\Carbon;

class CouponRepositoryImpl implements CouponRepository
{

    public function index()
    {
        // TODO: Implement index() method.
    }

    public function show($request, $couponName)
    {
        if (!$request->product_id) {
            abort("404", "کوپن اعمال نشد و نا معتبر است");
        }

        $modelId = $request->product_id;
        $modelName = "App/Product";

        $entry = Coupon::query()
            ->whereModelId($modelId)
            ->whereModelName($modelName)
            ->whereCouponName($couponName)
            ->firstOrFail();


        if (!($entry->started_at && $entry->expired_at)) {
            abort("404", "کوپن اعمال نشد و نا معتبر است");
        }

        $today = Carbon::now();
        $started_at = Carbon::parse($entry->started_at);
        $expired_at = Carbon::parse($entry->expired_at);

        $result = $expired_at->lt($today);
        if ($result) {
            abort("404", "کوپن منقضی شده است");
        }

        $result = $today->lte($started_at);
        if ($result) {
            abort("404", "کمپین شروع نشده است");
        }

        $entry->product_id = request()->product_id;
        return response(new CouponResource(['data' => $entry], true));
    }

}
