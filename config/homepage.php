<?php

return [
    [
        'style_type' => 'slider',
        'key' => 'group_id',
        'value' => 1
    ],
    [
        'style_type' => 'user_action',
        'icon' => 'tasks',
        'icon_url' => '/storage/upload/icons/checklist.svg',
        'title' => 'سفارشات من',
        'action_type' => 'deep_link',
        'action' => 'shop/orders'
    ],
    [
        'style_type' => 'product_category',
        'category_id' => 1,
        'product_ids' => [1, 2],
        'action_type' => 'deep_link',
        'action' => 'shop/category/1'
    ],
    [
        'style_type' => 'banner',
        'key' => 'id',
        'value' => 2,
        'title' => 'رژیم دکتر کرمانی',
        'action_type' => 'link',
        'action' => 'https://kermany.com/bmi/'
    ],
    [
        'style_type' => 'product_category',
        'category_id' => 3,
        'product_ids' => [3, 4],
        'action_type' => 'deep_link',
        'action' => 'shop/category/3'
    ],
    [
        'style_type' => 'banner',
        'key' => 'id',
        'value' => 4,
        'title' => 'روانشناسی',
        'action_type' => 'deep_link',
        'action' => '/psy/intro'
    ],
    [
        'style_type' => 'product_category',
        'category_id' => 2,
        'product_ids' => [1, 3],
        'action_type' => 'deep_link',
        'action' => 'shop/category/2'
    ],
    [
        'style_type' => 'banner',
        'key' => 'id',
        'value' => 3,
        'title' => 'فیتامین',
        'action_type' => 'link',
        'action' => 'https://app.fitamin.ir/'
    ],
];
