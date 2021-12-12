<?php


namespace App\Services;


use App\Models\OrderItem;
use App\Models\VideoLesson;

class MediaHelper
{

    public static function getHashedMediaUrlByLessonId($videoLessonId): string
    {
        $videoLesson = VideoLesson::query()->findOrFail($videoLessonId);
//dd($videoLesson);
        $userId = request()->input('user_id');

        if (!$userId) {
            return '';
        }

        $orderItem = OrderItem::with('order')
            ->whereHas('order', function ($query) use ($userId) {
                $query->where('user_id', '=', $userId);
            })
            ->where('product_id', $videoLesson->product_id)
            ->first();
//        dd($orderItem);
        // TODO if
        if ($orderItem) {
            return '/download/' . $orderItem->hashed_key . '/' . $videoLesson->product_id . '/' . $videoLessonId;
        }

        return '/download/' . $videoLesson->product_id . '/' . $videoLessonId;
    }

    /**
     * @param $isFreeLesson
     * @param $videoLesson
     * @return string
     */
    public static function getLessonVideoDownloadLink($videoLesson): string
    {
        $isFreeLesson = $videoLesson->is_free;
//        dd($isFreeLesson);
        return $isFreeLesson == 0 ? self::getHashedMediaUrlByLessonId($videoLesson->id) : $videoLesson->getFirstMediaUrl('videoList');
    }
}
