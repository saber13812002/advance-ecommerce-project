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
        return [
            "id" => (integer)$resource->id,
            "coupon_name" => $resource->coupon_name,
            "model_name" => $resource->model_name,
            "model_id" => $resource->model_id,
            "expired_at" => $resource->expired_at,
        ];
    }
}
