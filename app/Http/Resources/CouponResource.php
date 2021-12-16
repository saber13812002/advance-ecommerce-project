<?php

namespace App\Http\Resources;

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
            "model_type" => $resource->model_type,
            "model_id" => $resource->model_id,
            "expired_at" => $resource->expired_at,
        ];
    }
}
