<?php

namespace App\Http\Resources;

use Behamin\BResources\Resources\BasicResource;
use Behamin\BResources\Traits\CollectionResource;

class OrderResource extends BasicResource
{
    public function __construct($resource, $transform = false)
    {
        parent::__construct($resource, $transform);
    }

    public function getArray($resource)
    {
        $product = $resource->orderItems->product;

        return [
            'id' => $product->id,
            'product_name' => $product->product_name,
            'selling_price' => (int)$product->selling_price,
            'discount_price' => (int)$product->discount_price,
            "short_description" => $product->short_description,
            "long_description" => $product->long_description,
            "product_thambnail" => $resource->product_thambnail,
            "digital_file" => $resource->digital_file,
        ];
    }
}
