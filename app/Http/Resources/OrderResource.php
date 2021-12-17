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
            "brand_id" => (integer)$product->brand_id,
            "category_id" => (integer)$product->category_id,
            "subcategory_id" => (integer)$product->subcategory_id,
            "subsubcategory_id" => (integer)$product->subsubcategory_id,
            "product_name" => $product->product_name,
            "product_name_en" => $product->product_name_en,
            "product_name_hin" => $product->product_name_hin,
            "product_slug" => $product->product_slug,
            "product_slug_en" => $product->product_slug_en,
            "product_slug_hin" => $product->product_slug_hin,
            "product_code" => $product->product_code,
            "product_qty" => (integer)$product->product_qty,
            "product_tags" => $product->product_tags,
            "product_tags_en" => $product->product_tags_en,
            "product_tags_hin" => $product->product_tags_hin,
            "product_size" => $product->product_size,
            "product_size_en" => $product->product_size_en,
            "product_size_hin" => $product->product_size_hin,
            "product_color" => $product->product_color,
            "product_color_en" => $product->product_color_en,
            "product_color_hin" => $product->product_color_hin,
            "selling_price" => (integer)$product->selling_price,
            "discount_price" => (integer)$product->discount_price,
            "short_description" => $product->short_description,
            "short_descp_en" => $product->short_descp_en,
            "short_descp_hin" => $product->short_descp_hin,
            "long_descp_en" => $product->long_descp_en,
            "long_description" => $product->long_description,
            "long_descp_hin" => $product->long_descp_hin,
            "owner_name" => $product->owner_name,
            "product_thambnail" => $product->product_thambnail,
            "hot_deals" => $product->hot_deals,
            "featured" => $product->featured,
            "special_offer" => $product->special_offer,
            "special_deals" => $product->special_deals,
            "status" => $product->status,
            "created_at" => $product->created_at,
            "updated_at" => $product->updated_at,
            "digital_file" => $product->digital_file,
            "user_order_date" => $product->user_order_date,
            "action_type" => $product->action_type,
            "action" => $product->action,
        ];
    }
}
