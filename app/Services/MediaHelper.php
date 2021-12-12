<?php


namespace App\Services;


use App\Models\OrderItem;
use App\Models\VideoLesson;

class MediaHelper
{

    public static function getHashedMediaUrlByLessonId($videoLessonId)
    {
        $videoLesson = VideoLesson::query()->findOrFail($videoLessonId);

        $userId = request()->input('user_id');

        if (!$userId) {
            return null;
        }

        $orderItem = OrderItem::with('order')
            ->whereHas('order', function ($query) use ($userId) {
                $query->where('user_id', '=', $userId);
            })
            ->where('product_id', $videoLesson->product_id)
            ->first();

        if ($orderItem) {
            return env('APP_URL') . '/download/' . $orderItem->hashed_key . '/' . $videoLesson->product_id . '/' . $videoLessonId;
        }

        return null;
    }

    /**
     * @param $isFreeLesson
     * @param $videoLesson
     * @return string
     */
    public static function getLessonVideoDownloadLink($videoLesson)
    {
        $isFreeLesson = $videoLesson->is_free;
//        dd($isFreeLesson);
        return $isFreeLesson == 0 ? self::getHashedMediaUrlByLessonId($videoLesson->id) : $videoLesson->getFirstMediaUrl('videoList');
    }
}
