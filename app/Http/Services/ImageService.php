<?php


namespace App\Http\Services;


class ImageService
{

    public static function getSize(string $imageType): array
    {
        if ($imageType == 'slider') {
            return [560, 360];
        }
        if ($imageType == 'banner') {
            return [870, 370];
        }
        return [234, 345];
    }
}
