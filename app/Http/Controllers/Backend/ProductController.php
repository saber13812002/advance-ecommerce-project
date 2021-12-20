<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Http\Filters\ProductFilter;
use App\Http\Resources\ProductResourceCollection;
use App\Http\Resources\ProductWithDetailResource;
use App\Models\Brand;
use App\Models\Category;
use App\Models\MultiImg;
use App\Models\Product;
use App\Models\SubCategory;
use App\Models\SubSubCategory;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Image;

class ProductController extends Controller
{

    /**
     * @OA\Get(path="/api/products",
     *   tags={"Products"},
     *   summary="Returns products as json",
     *   description="Returns products",
     *   operationId="getProducts",
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
    public function index(ProductFilter $filters)
    {
        [$entries, $count, $sum] = Product::filter($filters);
        $entries = $entries->get();
        return response(new ProductResourceCollection(['data' => $entries, 'count' => $count], true));
    }

    public function create(ProductFilter $filters)
    {
        return view('backend.product.create');
    }

    /**
     * @OA\Get(path="/api/products/{productId}",
     *   tags={"Products"},
     *   summary="Returns product by id as json",
     *   description="Returns products by id",
     *   operationId="getProductsbyid",
     *
     *  @OA\Parameter(
     *       description="ID of product",
     *       name="productId",
     *       required=true,
     *       in="path",
     *       example="1",
     *       @OA\Schema(
     *           type="integer",
     *           format="int64"
     *       )
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
    public function show(int $productId)
    {
        $entry = Product::query()->findOrFail($productId);
        return response(new ProductWithDetailResource(['data' => $entry], true));
    }

    public function AddProduct()
    {
        $categories = Category::latest()->get();
        $brands = Brand::latest()->get();
        return view('backend.product.product_add', compact('categories', 'brands'));

    }


    public function StoreProduct(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:jpeg,png,jpg,zip,pdf|max:2048',
        ]);

        if ($files = $request->file('file')) {
            $destinationPath = 'storage/upload/pdf'; // upload path
            $digitalItem = date('YmdHis') . "." . $files->getClientOriginalExtension();
            $files->move($destinationPath, $digitalItem);
        }

        $path = '/storage/upload/products/thambnail/';

        if (!File::exists($path)) {
            File::makeDirectory($path);
        }

        $image = $request->file('product_thambnail');
        $name_gen = date('Y-m-d-H-i-s') . hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        $save_url = $path . $name_gen;

        $product_id = Product::insertGetId([
            'brand_id' => $request->brand_id,
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'subsubcategory_id' => $request->subsubcategory_id,
            'product_name_en' => $request->product_name_en,
            'product_name_hin' => $request->product_name_hin,
            'product_slug_en' => strtolower(str_replace(' ', '-', $request->product_name_en)),
            'product_slug_hin' => str_replace(' ', '-', $request->product_name_hin),
            'product_code' => $request->product_code,

            'owner_name' => $request->owner_name,
            'owner_model_name' => $request->owner_model_name,
            'owner_model_id' => $request->owner_model_id,

            'product_qty' => $request->product_qty,
            'product_tags_en' => $request->product_tags_en,
            'product_tags_hin' => $request->product_tags_hin,
            'product_size_en' => $request->product_size_en,
            'product_size_hin' => $request->product_size_hin,
            'product_color_en' => $request->product_color_en,
            'product_color_hin' => $request->product_color_hin,

            'selling_price' => $request->selling_price,
            'discount_price' => $request->discount_price,
            'short_descp_en' => $request->short_descp_en,
            'short_descp_hin' => $request->short_descp_hin,
            'long_descp_en' => $request->long_descp_en,
            'long_descp_hin' => $request->long_descp_hin,

            'hot_deals' => $request->hot_deals,
            'featured' => $request->featured,
            'special_offer' => $request->special_offer,
            'special_deals' => $request->special_deals,

            'product_thambnail' => $save_url,

            'digital_file' => $digitalItem,
            'status' => 1,
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),

        ]);

        $path = '/storage/upload/products/thambnail/';

        if (!File::exists($path)) {
            File::makeDirectory($path);
        }

        Image::make($image)->resize(430, 246)->save(public_path('/upload/products/thambnail/') . $name_gen);

        ////////// Multiple Image Upload Start ///////////

        $path = '/storage/upload/products/multi-image/';

        if (!File::exists($path)) {
            File::makeDirectory($path);
        }

        $images = $request->file('multi_img');

        foreach ($images as $img) {
            $make_name = date('Y-m-d-H-i-s') . hexdec(uniqid()) . '.' . $img->getClientOriginalExtension();
            // TODO move size to Helper or config
            Image::make($img)->resize(430, 246)->save(public_path('/upload/products/multi-image/') . $make_name);
            $uploadPath = $path . $make_name;

            MultiImg::insert([

                'product_id' => $product_id,
                'photo_name' => $uploadPath,
                'created_at' => Carbon::now(),

            ]);

        }

        ////////// Een Multiple Image Upload Start ///////////


        $notification = array(
            'message' => 'Product Inserted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('manage-product')->with($notification);
    }


    public function ManageProduct()
    {
        $products = Product::latest()->get();
        return view('backend.product.product_view', compact('products'));
    }


    public function EditProduct($id)
    {
        $multiImgs = MultiImg::where('product_id', $id)->get();

        $categories = Category::latest()->get();
        $brands = Brand::latest()->get();
        $subcategory = SubCategory::latest()->get();
        $subSubCategory = SubSubCategory::latest()->get();
        $product = Product::findOrFail($id);
        return view('backend.product.product_edit', compact('categories', 'brands', 'subcategory', 'subSubCategory', 'product', 'multiImgs'));
    }


    public function ProductDataUpdate(Request $request)
    {

        $product_id = $request->id;

        Product::findOrFail($product_id)->update([
            'brand_id' => $request->brand_id,
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'subsubcategory_id' => $request->subsubcategory_id,
            'product_name_en' => $request->product_name_en,
            'product_name_hin' => $request->product_name_hin,
            'product_slug_en' => strtolower(str_replace(' ', '-', $request->product_name_en)),
            'product_slug_hin' => str_replace(' ', '-', $request->product_name_hin),
            'product_code' => $request->product_code,


            'owner_name' => $request->owner_name,
            'owner_model_name' => $request->owner_model_name,
            'owner_model_id' => $request->owner_model_id,

            'product_qty' => $request->product_qty,
            'product_tags_en' => $request->product_tags_en,
            'product_tags_hin' => $request->product_tags_hin,
            'product_size_en' => $request->product_size_en,
            'product_size_hin' => $request->product_size_hin,
            'product_color_en' => $request->product_color_en,
            'product_color_hin' => $request->product_color_hin,

            'selling_price' => $request->selling_price,
            'discount_price' => $request->discount_price,
            'short_descp_en' => $request->short_descp_en,
            'short_descp_hin' => $request->short_descp_hin,
            'long_descp_en' => $request->long_descp_en,
            'long_descp_hin' => $request->long_descp_hin,

            'hot_deals' => $request->hot_deals,
            'featured' => $request->featured,
            'special_offer' => $request->special_offer,
            'special_deals' => $request->special_deals,
            'status' => 1,
            'updated_at' => Carbon::now(),

        ]);

        $notification = array(
            'message' => 'Product Updated Without Image Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('manage-product')->with($notification);
    }


/// Multiple Image Update
    public function MultiImageUpdate(Request $request)
    {
        $imgs = $request->multi_img;

        $path = '/storage/upload/products/multi-image/';

        if (!File::exists($path)) {
            File::makeDirectory($path);
        }

        foreach ($imgs as $id => $img) {
            $imgDel = MultiImg::findOrFail($id);

            if (file_exists($imgDel->photo_name)) {
                unlink($imgDel->photo_name);
            }

            $make_name = date('Y-m-d-H-i-s') . hexdec(uniqid()) . '.' . $img->getClientOriginalExtension();
            // TODO move size to Helper or config 917, 1000
            Image::make($img)->resize(430, 246)->save(public_path('/upload/products/multi-image/') . $make_name);
            $uploadPath = $path . $make_name;

            MultiImg::where('id', $id)->update([
                'photo_name' => $uploadPath,
                'updated_at' => Carbon::now(),
            ]);
        }

        $notification = array(
            'message' => 'Product Image Updated Successfully',
            'alert-type' => 'info'
        );

        return redirect()->back()->with($notification);

    }


    /// Product Main Thambnail Update ///
    public function ThambnailImageUpdate(Request $request)
    {
        $pro_id = $request->id;
        $oldImage = $request->old_img;

        if (file_exists($oldImage)) {
            unlink($oldImage);
        }

        $path = '/storage/upload/products/thambnail/';

        if (!File::exists($path)) {
            File::makeDirectory($path);
        }

        $image = $request->file('product_thambnail');
        $name_gen = date('Y-m-d-H-i-s') . hexdec(uniqid()) . '.' . $image->getClientOriginalExtension();
        Image::make($image)->resize(430, 246)->save(public_path('/upload/products/thambnail/') . $name_gen);
        $save_url = $path . $name_gen;

        Product::findOrFail($pro_id)->update([
            'product_thambnail' => $save_url,
            'updated_at' => Carbon::now(),

        ]);

        $notification = array(
            'message' => 'Product Image Thambnail Updated Successfully',
            'alert-type' => 'info'
        );

        return redirect()->back()->with($notification);

    }


    //// Multi Image Delete ////
    public function MultiImageDelete($id)
    {
        $oldimg = MultiImg::findOrFail($id);

        if (file_exists($oldimg)) {
            unlink($oldimg->photo_name);
        }

        MultiImg::findOrFail($id)->delete();

        $notification = array(
            'message' => 'Product Image Deleted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    }


    public function ProductInactive($id)
    {
        Product::findOrFail($id)->update(['status' => 0]);
        $notification = array(
            'message' => 'Product Inactive',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    }


    public function ProductActive($id)
    {
        Product::findOrFail($id)->update(['status' => 1]);
        $notification = array(
            'message' => 'Product Active',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    }


    public function ProductDelete($id)
    {
        $product = Product::findOrFail($id);

        if (file_exists($product->product_thambnail)) {
            unlink($product->product_thambnail);
        }

        Product::findOrFail($id)->delete();

        $images = MultiImg::where('product_id', $id)->get();
        foreach ($images as $img) {
            if (file_exists($img->photo_name)) {
                unlink($img->photo_name);
            }

            MultiImg::where('product_id', $id)->delete();
        }

        $notification = array(
            'message' => 'Product Deleted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    }// end method


    // product Stock
    public function ProductStock()
    {

        $products = Product::latest()->get();
        return view('backend.product.product_stock', compact('products'));
    }


}
