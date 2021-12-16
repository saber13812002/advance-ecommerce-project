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
        $product = Product::query()->where("id", $resource->model_id)->first();
        if ($resource->model_name && $resource->model_id) {
            $discount = $resource->coupon_discount;
            $final_price = $product->discount_price - $resource->discount;
        }
        return [
            "id" => (integer)$resource->id,
            "coupon_name" => $resource->coupon_name,
            "model_name" => $resource->model_name,
            "model_id" => $resource->model_id,
            "expired_at" => $resource->expired_at,
            "discount" => $discount,
            "final_price" => $final_price,
        ];
    }
}
