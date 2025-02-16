<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Filters\SliderFilter;
use App\Http\Resources\SliderResourceCollection;
use App\Http\Services\ImageService;
use App\Models\Slider;
use File;
use Illuminate\Http\Request;
use Image;

class SliderController extends Controller
{

    /**
     * @OA\Get(path="/api/sliders",
     *   tags={"Sliders"},
     *   summary="Returns sliders as json",
     *   description="Returns sliders",
     *   operationId="getSliders",
     *   parameters={},
     *   @OA\Response(
     *     response=200,
     *     description="successful operation",
     *     @OA\Schema(
     *       additionalProperties={
     *         "type":"integer",
     *         "format":"int32"
     *       }
     *     )
     *   )
     * )
     */
    public function index(SliderFilter $filters)
    {
        [$entries, $count, $sum] = Slider::filter($filters);
        $entries = $entries->get();
        return response(new SliderResourceCollection(['data' => $entries, 'count' => $count]));
    }

    public function SliderView()
    {
        $sliders = Slider::latest()->get();
        return view('backend.slider.slider_view', compact('sliders'));
    }


    public function SliderStore(Request $request)
    {

        $request->validate([

            'slider_img' => 'required',
        ], [
            'slider_img.required' => 'Plz Select One Image',

        ]);

        $path = 'storage/upload/slider/';

        if (!File::exists($path)) {
            File::makeDirectory($path);
        }

        $imageType = $request->group_id ? 'slider' : 'banner';
        [$height, $weight] = ImageService::getSize($imageType);

        $image = $request->file('slider_img');
        $name_gen = date('Y-m-d-H-i-s') . hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        // TODO move size to Helper or config
        Image::make($image)->resize($height, $weight)->save(public_path('/upload/slider/') . $name_gen);
        $save_url = '/' . $path . $name_gen;

        Slider::insert([
            'title' => $request->title,
            'description' => $request->description,
            'group_id' => $request->group_id,
            'model_id' => $request->model_id,
            'model_name' => $request->model_name,
            'action_type' => $request->action_type,
            'action' => $request->action,
            'slider_img' => $save_url,

        ]);

        $notification = array(
            'message' => 'Slider Inserted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    }


    public function SliderEdit($id)
    {
        $slider = Slider::findOrFail($id);
        return view('backend.slider.slider_edit', compact('slider'));
    }


    public function SliderUpdate(Request $request)
    {

        $slider_id = $request->id;
        $old_img = $request->old_image;

        if ($request->file('slider_img')) {
            if (file_exists($old_img)) {
                unlink($old_img);
            }

            $path = 'storage/upload/slider/';

            if (!File::exists($path)) {
                File::makeDirectory($path);
            }

            $imageType = $request->group_id ? 'slider' : 'banner';
            [$height, $weight] = ImageService::getSize($imageType);

            $image = $request->file('slider_img');
            $name_gen = date('Y-m-d-H-i-s') . hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
            // TODO move size to Helper or config 870, 370
            Image::make($image)->resize($height, $weight)->save(public_path('/upload/slider/') . $name_gen);
            $save_url = '/' . $path . $name_gen;

            Slider::findOrFail($slider_id)->update([
                'title' => $request->title,
                'description' => $request->description,
                'slider_img' => $save_url,
                'group_id' => $request->group_id,
                'model_id' => $request->model_id,
                'model_name' => $request->model_name,
                'action_type' => $request->action_type,
                'action' => $request->action,
            ]);

            $notification = array(
                'message' => 'Slider Updated Successfully',
                'alert-type' => 'info'
            );

        } else {

            Slider::findOrFail($slider_id)->update([
                'title' => $request->title,
                'description' => $request->description,
                'group_id' => $request->group_id,
                'model_id' => $request->model_id,
                'model_name' => $request->model_name,
                'action_type' => $request->action_type,
                'action' => $request->action,


            ]);

            $notification = array(
                'message' => 'Slider Updated Without Image Successfully',
                'alert-type' => 'info'
            );

        }// end else
        return redirect()->route('manage-slider')->with($notification);
    }


    public function SliderDelete($id)
    {
        $slider = Slider::findOrFail($id);
        $img = $slider->slider_img;

        if (file_exists($img)) {
            unlink($img);
        }

        Slider::findOrFail($id)->delete();

        $notification = array(
            'message' => 'Slider Delectd Successfully',
            'alert-type' => 'info'
        );

        return redirect()->back()->with($notification);

    }


    public function SliderInactive($id)
    {
        Slider::findOrFail($id)->update(['status' => 0]);

        $notification = array(
            'message' => 'Slider Inactive Successfully',
            'alert-type' => 'info'
        );

        return redirect()->back()->with($notification);

    }


    public function SliderActive($id)
    {
        Slider::findOrFail($id)->update(['status' => 1]);

        $notification = array(
            'message' => 'Slider Active Successfully',
            'alert-type' => 'info'
        );

        return redirect()->back()->with($notification);

    }


}
