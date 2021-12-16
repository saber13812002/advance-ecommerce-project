<?php

namespace App\Http\Resources;

use App\Models\Product;
use Behamin\BResources\Resources\BasicResource;

class CouponResource extends BasicResource
{
    public function __construct($resource, $transform = false)
    {
        parent::__construct($resource, $transform);
    }

    public function getArray($resource)
    {
//        dd($resource->product_id);
        $productId = $resource->product_id;
        $product = Product::query()->where("id", $productId)->first();

        if (!$product) {
            abort("404", "کوپن اعمال نشد و نا معتبر است");
        }

        if ($resource->model_name && $resource->model_id) {
            $discount = $resource->coupon_discount;
            $final_price = $product->discount_price - $resource->coupon_discount;
        }

        return [
//            "id" => (integer)$resource->id,
//            "coupon_name" => $resource->coupon_name,
//            "model_name" => $resource->model_name,
//            "model_id" => $resource->model_id,
            "discount" => $discount,
            "final_price" => $final_price,
            "expired_at" => $resource->expired_at,
        ];
    }
}
