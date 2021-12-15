<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\VideoLesson;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Image;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class ProductVideoLessonController extends Controller
{

    /**
     * Write Your Code..
     *
     * @return string
     */
    public function store(Request $request, $productId)
    {
        $valiator = $request->validate([
            'name' => 'required',
            'order' => 'numeric',
            'is_free' => 'numeric',
            'minutes' => 'numeric',
            'media' => 'required',
        ]);

        $videoLesson = new VideoLesson();
        $videoLesson->lesson_name = $request->name;
        $videoLesson->order = $request->order;
        $videoLesson->is_free = (bool)$request->is_free;
        $videoLesson->minutes = $request->minutes;
        $videoLesson->product_id = $productId;
        $videoLesson->save();

        if ($request->hasFile('media') && $request->file('media')->isValid()) {
            $videoLesson->addMediaFromRequest('media')->toMediaCollection('videoList');
        }

        return redirect()->route('product.video_lessons.list.view', $productId);
    }

    /**
     * Write Your Code..
     *
     * @return string
     */
    public function update(Request $request)
    {

        $valiator = $request->validate([
            'name' => 'required',
            'order' => 'required',
        ]);

        $videoLesson = VideoLesson::query()->findOrFail($request->product_id);
        $videoLesson->lesson_name = $request->name;
        $videoLesson->order = $request->order;
        $videoLesson->is_free = (bool)$request->is_free;
        $videoLesson->minutes = $request->minutes;
        $videoLesson->product_id = $request->product_id;
        $videoLesson->save();

        if ($request->hasFile('media') && $request->file('media')->isValid()) {
            $videoLesson->addMediaFromRequest('media')->toMediaCollection('videoList');
        }

        return redirect()->route('product.video_lessons.list.view', $request->product_id);

    }

    public function viewVideoLessonsList($productId)
    {
        $videoLessons = VideoLesson::where('product_id', $productId)->get();
        return view('backend.product.video-lesson.product_view_video_lessons_list', compact('videoLessons', 'productId'));
    }

    public function AddVideoLesson($productId)
    {
        return view('backend.product.video-lesson.product_add_media', compact('productId'));
    }

    public function EditVideoLesson(int $productId, int $lessonId)
    {
        $videoLesson = VideoLesson::query()->findOrFail($lessonId);
        return view('backend.product.video-lesson.product_edit_media', compact('productId', 'videoLesson'));
    }

    public function MultiMediaUpdate(Request $request, int $lessonId)
    {
        $videoLesson = VideoLesson::query()->findOrFail($lessonId);
        $productId = $videoLesson->product_id;

        $videoLesson = VideoLesson::query()->findOrFail($lessonId);
        $videoLesson->lesson_name = $request->name;
        $videoLesson->order = $request->order;
        $videoLesson->is_free = (bool)$request->is_free;
        $videoLesson->minutes = $request->minutes;
        $videoLesson->save();

        if ($request->hasFile('media') && $request->file('media')->isValid()) {
            $this->softDeleteVideoLessonMedia($videoLesson);
            $videoLesson->addMediaFromRequest('media')->toMediaCollection('videoList');

            $notification = array(
                'message' => 'VideoLesson Media Updated Successfully',
                'alert-type' => 'success'
            );

        }

        $notification = array(
            'message' => 'VideoLesson Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('product.video_lessons.list.view', $productId)->with($notification);
    }

    public function MultiMediaDelete($videoLessonId)
    {
        $videoLesson = $this->deleteVideoLessonById($videoLessonId);

        $notification = array(
            'message' => 'Product Media Deleted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('product.video_lessons.list.view', $videoLesson->product_id)->with($notification);
    }

    /**
     * @param $videoLessonId
     * @return \Illuminate\Database\Eloquent\Builder|\Illuminate\Database\Eloquent\Builder[]|\Illuminate\Database\Eloquent\Collection|\Illuminate\Database\Eloquent\Model|null
     */
    public function deleteVideoLessonById($videoLessonId)
    {
        $videoLesson = VideoLesson::query()->findOrFail($videoLessonId);
        $videoLesson->delete();

        $this->softDeleteVideoLessonMedia($videoLesson);
        return $videoLesson;
    }

    /**
     * @param $videoLesson
     */
    public function softDeleteVideoLessonMedia($videoLesson): void
    {
        $medias = $videoLesson->getMedia('videoList');
        $media = $medias->first();
        $myMedia = Media::find($media->id);
        $myMedia->update(['collection_name' => 'videoListDeleted']);
        Artisan::call('media-library:regenerate --ids=' . $myMedia->id);
    }


}
