<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\CouponRequest;
use App\Http\Resources\CouponResourceCollection;
use App\Interfaces\Repositories\CouponRepository;
use App\Models\Coupon;
use App\Services\CouponService;
use BFilters\Filter;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;

class CouponController extends Controller
{

    /**
     * @OA\Get(path="/api/coupons",
     *   tags={"Coupons"},
     *   summary="Returns coupons as json",
     *   description="Returns coupons",
     *   operationId="getCoupons",
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
    public function index(Filter $filters)
    {
        [$entries, $count, $sum] = Coupon::filter($filters);
        $entries = $entries->get();
        return response(new CouponResourceCollection(['data' => $entries, 'count' => $count], true));
    }


    /**
     * @OA\Post (path="/api/coupons/{couponName}",
     *   tags={"Coupons"},
     *   summary="Returns coupon by name as json",
     *   description="Return coupon by name",
     *   operationId="getCouponsByName",
     *
     *  @OA\Parameter(
     *       description="couponName",
     *       name="couponName",
     *       required=true,
     *       in="path",
     *       example="TAKHFIF",
     *       @OA\Schema(
     *           type="string"
     *       )
     *   ),
     *
     *   @OA\RequestBody(
     *       required=true,
     *       @OA\JsonContent(ref="#/components/schemas/CouponRequest")
     *   ),
     *
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
    public function show(CouponRequest $request, string $couponName)
    {
        try {
            return app()->make(CouponRepository::class)
                ->show($request, $couponName);
        } catch (\Exception $ex) {
            if ($ex instanceof ModelNotFoundException) {
                return response()->json(['error' => trans("coupon.coupon_not_found")]);
            }
            return CouponService::couponError($ex->getMessage());
        }
    }

    public function CouponView()
    {
        $coupons = Coupon::orderBy('id', 'DESC')->get();
        return view('backend.coupon.view_coupon', compact('coupons'));
    }


    public function CouponStore(Request $request)
    {
        $request->validate([
            'coupon_name' => 'required',

            'model_name' => 'required',
            'model_id' => 'required',

            'coupon_discount_type' => 'required',
            'coupon_discount' => 'required',

            'started_at' => 'required',
            'expired_at' => 'required',
        ]);


        Coupon::insert([
            'coupon_name' => strtoupper($request->coupon_name),
            'coupon_discount' => $request->coupon_discount,
            'model_name' => $request->model_name,
            'model_id' => $request->model_id,
            'coupon_discount_type' => $request->coupon_discount_type,

            'started_at' => $request->started_at,
            'message_before_started_at' => $request->message_before_started_at,

            'expired_at' => $request->expired_at,
            'message_after_expired_at' => $request->message_after_expired_at,

            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),

        ]);

        $notification = array(
            'message' => 'Coupon Inserted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    }


    public function CouponEdit($id)
    {
        $coupons = Coupon::findOrFail($id);
        return view('backend.coupon.edit_coupon', compact('coupons'));
    }


    public function CouponUpdate(Request $request, $id)
    {
        Coupon::findOrFail($id)->update([
            'coupon_name' => strtoupper($request->coupon_name),
            'coupon_discount' => $request->coupon_discount,
            'model_name' => $request->model_name,
            'model_id' => $request->model_id,
            'coupon_discount_type' => $request->coupon_discount_type,

            'started_at' => $request->started_at,
            'message_before_started_at' => $request->message_before_started_at,

            'expired_at' => $request->expired_at,
            'message_after_expired_at' => $request->message_after_expired_at,

            'updated_at' => Carbon::now(),
        ]);

        $notification = array(
            'message' => 'Coupon Updated Successfully',
            'alert-type' => 'info'
        );

        return redirect()->route('manage-coupon')->with($notification);
    }


    public function CouponDelete($id)
    {
        Coupon::findOrFail($id)->delete();
        $notification = array(
            'message' => 'Coupon Deleted Successfully',
            'alert-type' => 'info'
        );

        return redirect()->back()->with($notification);
    }


}
