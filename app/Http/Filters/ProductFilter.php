<?php

namespace App\Http\Filters;

use BFilters\Filter;
use Illuminate\Http\Request;

class ProductFilter extends Filter
{
    public function __construct(Request $request)
    {
        parent::__construct($request);
        $this->relations = [];

        //$this->sumField = null;
    }
}
