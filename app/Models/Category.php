<?php

namespace App\Models;

use BFilters\Traits\HasFilter;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Category extends Model
{
    use HasFactory;
    use SoftDeletes;
    use HasFilter;


    protected $fillable = [
        'category_name_en',
        'category_name_hin',
        'category_slug_en',
        'category_slug_hin',
        'category_icon',
        'image',
    ];


    public function products(): HasMany
    {
        return $this->hasMany(Product::class);
    }

    public function getCategoryNameAttribute()
    {
        $current_language = request()->header('Accept-Language');
        return !$current_language == "en" ? $this->category_name_hin : $this->category_name_en;
    }
    public function getCategorySlugAttribute()
    {
        $current_language = request()->header('Accept-Language');
        return !$current_language == "en" ? $this->category_slug_hin : $this->category_slug_en;
    }

}
