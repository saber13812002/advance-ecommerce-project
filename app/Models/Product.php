<?php

namespace App\Models;

use BFilters\Traits\HasFilter;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Product extends Model
{
    use HasFactory;
    use HasFilter;

    protected $guarded = [];

    public function category(): BelongsTo
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }


    public function brand(): BelongsTo
    {
        return $this->belongsTo(Brand::class, 'brand_id', 'id');
    }

    /**
     * Get the user's order date.
     *
     * @param string $value
     * @return string
     */
    public function getUserOrderDateAttribute(): ?string
    {
        $userId = request()->input('user_id');

        if (!$userId) {
            return null;
        }

        $orderItem = OrderItem::with('order')
            ->whereHas('order', function ($query) use ($userId) {
                $query->where('user_id', '=', $userId)
                    ->where('status', 'payed');
            })
            ->where('product_id', $this->id)
            ->orderBy('id', 'desc')
            ->first();

        if (!$orderItem) {
            return null;
        }

        return Carbon::parse($orderItem->created_at)->format('d-m-Y');
    }

    public function getProductNameAttribute()
    {
        $current_language = request()->header('Accept-Language');
        return !$current_language == "en" ? $this->product_name_hin : $this->product_name_en;
    }

    public function getProductSlugAttribute()
    {
        $current_language = request()->header('Accept-Language');
        return !$current_language == "en" ? $this->product_slug_hin : $this->product_slug_en;
    }

    public function getProductTagsAttribute()
    {
        $current_language = request()->header('Accept-Language');
        return !$current_language == "en" ? $this->product_tags_hin : $this->product_tags_en;
    }

    public function getProductSizeAttribute()
    {
        $current_language = request()->header('Accept-Language');
        return !$current_language == "en" ? $this->product_size_hin : $this->product_size_en;
    }

    public function getProductColorAttribute()
    {
        $current_language = request()->header('Accept-Language');
        return !$current_language == "en" ? $this->product_color_hin : $this->product_color_en;
    }

    public function getShortDescriptionAttribute()
    {
        $current_language = request()->header('Accept-Language');
        return !$current_language == "en" ? $this->short_descp_hin : $this->short_descp_en;
    }

    public function getLongDescriptionAttribute()
    {
        $current_language = request()->header('Accept-Language');
        return !$current_language == "en" ? $this->long_descp_hin : $this->long_descp_en;
    }


    /**
     * Get the action type.
     *
     * @param string $value
     * @return string
     */
    public function getActionTypeAttribute(): string
    {
        return "link";
    }

    /**
     * Get the action.
     *
     * @param string $value
     * @return string
     */
    public function getActionAttribute(): string
    {
        return "shop/product";
    }
}
