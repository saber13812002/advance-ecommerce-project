<?php

namespace App\Interfaces\Repositories;

interface CouponRepository
{
    public function index();

    public function show($request, $couponName);
}
