<?php

namespace App\Http\Resources;

use Behamin\BResources\Resources\BasicResource;

class CategoryResource extends BasicResource
{
    public function __construct($resource, $transform = false)
    {
        parent::__construct($resource, $transform);
    }

    public function getArray($resource)
    {
        return [
            "id" => (integer)$resource->id,
            "category_name" => $resource->category_name,
            "category_name_en" => $resource->category_name_en,
            "category_name_hin" => $resource->category_name,
            "category_slug" => $resource->category_slug,
            "category_slug_en" => $resource->category_slug_en,
            "category_slug_hin" => $resource->category_slug_hin,
            "category_icon" => $resource->category_icon,
            "image" => $resource->image,
        ];
    }
}
