<?php

namespace App\Interfaces\Repositories;

interface CouponRepository
{
    public function index();

    public function show(int $couponId);

    public function query($request, $couponName);
}
