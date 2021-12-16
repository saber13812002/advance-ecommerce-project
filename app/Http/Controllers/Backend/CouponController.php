<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Requests\CouponRequest;
use App\Http\Resources\CouponResource;
use App\Http\Resources\CouponResourceCollection;
use App\Http\Resources\ProductWithDetailResource;
use App\Models\Product;
use BFilters\Filter;
use Illuminate\Http\Request;
use App\Models\Coupon;
use Carbon\Carbon;

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
        if (!$request->product_id) {
            abort("404", "کوپن اعمال نشد و نا معتبر است");
        }

        $entry = Coupon::query()->whereCouponName($couponName)->firstOrFail();
        $entry->product_id = request()->product_id;
        return response(new CouponResource(['data' => $entry], true));
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
            'coupon_discount' => 'required',
            'coupon_validity' => 'required',

        ]);


        Coupon::insert([
            'coupon_name' => strtoupper($request->coupon_name),
            'coupon_discount' => $request->coupon_discount,
            'coupon_validity' => $request->coupon_validity,
            'created_at' => Carbon::now(),

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
            'coupon_validity' => $request->coupon_validity,
            'created_at' => Carbon::now(),

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
