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
        'action' => 'shop/myorders'
    ],
    [
        'style_type' => 'banner',
        'key' => 'id',
        'value' => 2,
        'title' => 'رژیم+ورزش',
        'action_type' => 'link',
        'action' => 'https://app.fitamin.ir/'
    ],
    [
        'style_type' => 'product_category',
        'category_id' => 1,
        'product_ids' => [1, 2],
        'action_type' => 'deep_link',
        'action' => 'shop/category'
    ],
    [
        'style_type' => 'banner',
        'key' => 'id',
        'value' => 3,
        'title' => 'فیتامین',
        'action_type' => 'link',
        'action' => 'https://app.fitamin.ir/'
    ],
    [
        'style_type' => 'product_category',
        'category_id' => 3,
        'product_ids' => [3, 4],
        'action_type' => 'deep_link',
        'action' => 'shop/category'
    ],
    [
        'style_type' => 'banner',
        'key' => 'id',
        'value' => 4,
        'title' => 'روانشناسی',
        'action_type' => 'link',
        'action' => 'https://psychology.kermany.ir/'
    ],
];
