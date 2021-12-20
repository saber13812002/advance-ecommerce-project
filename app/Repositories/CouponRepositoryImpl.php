<?php


namespace App\Repositories;


use App\Http\Resources\CouponResource;
use App\Interfaces\Repositories\CouponRepository;
use App\Models\Coupon;

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

        $entry->product_id = request()->product_id;
        return response(new CouponResource(['data' => $entry], true));
    }

}
