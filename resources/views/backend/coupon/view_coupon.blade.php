@extends('admin.admin_master')
@section('admin')


    <!-- Content Wrapper. Contains page content -->

    <div class="container-full">
        <!-- Content Header (Page header) -->


        <!-- Main content -->
        <section class="content">
            <div class="row">


                <div class="col-8">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">{{ trans("admin.Coupon List")   }} <span
                                    class="badge badge-pill badge-danger"> {{ count($coupons) }} </span></h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>{{ trans("admin.Coupon Name")   }} </th>
                                        <th>{{ trans("admin.Coupon Discount") }}</th>
                                        <th>{{ trans("admin.coupon_discount_type")   }} </th>
                                        <th>{{ trans("admin.model_name")   }} </th>
                                        <th>{{ trans("admin.model_id")   }} </th>
                                        <th>{{ trans("admin.Coupon Started Date")   }} </th>
                                        <th>{{ trans("admin.message_before_started_at")   }} </th>
                                        <th>{{ trans("admin.Coupon Expired Date")   }} </th>
                                        <th>{{ trans("admin.message_after_expired_at")   }} </th>
                                        <th>{{ trans("admin.Status")   }} </th>
                                        <th>{{ trans("admin.Action")   }}</th>

                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($coupons as $item)
                                        <tr>
                                            <td> {{ $item->coupon_name }}  </td>
                                            <td> {{ $item->coupon_discount }}  </td>
                                            <td> {{ $item->coupon_discount_type }}</td>
                                            <td> {{ $item->model_name }}</td>
                                            <td> {{ $item->model_id }}</td>
                                            <td>
                                                {{ Carbon\Carbon::parse($item->started_at)->format('D, d F Y') }}
                                            </td>
                                            <td> {{ $item->message_before_started_at }}</td>
                                            <td>
                                                {{ Carbon\Carbon::parse($item->expired_at)->format('D, d F Y') }}
                                            </td>
                                            <td> {{ $item->message_after_expired_at }}</td>

                                            <td>
                                                @if($item->started_at >= Carbon\Carbon::now()->format('Y-m-d'))
                                                    <span class="badge badge-pill badge-success"> Valid </span>
                                                @else
                                                    <span class="badge badge-pill badge-danger"> Invalid </span>
                                                @endif
                                            </td>

                                            <td width="25%">
                                                <a href="{{ route('coupon.edit',$item->id) }}" class="btn btn-info"
                                                   title="Edit Data"><i class="fa fa-pencil"></i> </a>
                                                <a href="{{ route('coupon.delete',$item->id) }}" class="btn btn-danger"
                                                   title="Delete Data" id="delete">
                                                    <i class="fa fa-trash"></i></a>
                                            </td>

                                        </tr>
                                    @endforeach
                                    </tbody>

                                </table>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->


                </div>
                <!-- /.col -->


                <!--   ------------ Add Category Page -------- -->


                <div class="col-4">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">{{ trans("admin.Add Coupon")   }} </h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="table-responsive">


                                <form method="post" action="{{ route('coupon.store') }}">
                                    @csrf

                                    <div class="form-group">
                                        <h5>{{ trans("admin.Coupon Name")   }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="coupon_name" class="form-control">
                                            @error('coupon_name')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.Coupon Discount") }} <span class="text-danger">*</span>
                                        </h5>
                                        <div class="controls">
                                            <input type="text" name="coupon_discount" class="form-control">
                                            @error('coupon_discount')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.coupon_discount_type")   }} <span
                                                class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <select name="coupon_discount_type" class="form-control">
                                                <option value="" selected="" disabled="">Select Type</option>
                                                <option value="Percent">Percent</option>
                                                <option value="Toman">Toman</option>
                                            </select>
                                            @error('coupon_discount_type')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.model_name")   }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="model_name" class="form-control">
                                            @error('model_name')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.model_id")   }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="model_id" class="form-control">
                                            @error('model_id')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.Coupon Started Date")   }} <span
                                                class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="date" name="started_at" class="form-control"
                                                   min="{{ Carbon\Carbon::now()->addDays(-1)->format('Y-m-d') }}">
                                            @error('started_at')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.message_before_started_at")   }} <span
                                                class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="message_before_started_at" class="form-control">
                                            @error('message_before_started_at')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.Coupon Expired Date")   }} <span
                                                class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="date" name="expired_at" class="form-control"
                                                   min="{{ Carbon\Carbon::now()->format('Y-m-d') }}">
                                            @error('expired_at')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.message_after_expired_at")   }} <span
                                                class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="message_after_expired_at" class="form-control">
                                            @error('message_after_expired_at')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="text-xs-right">
                                        <input type="submit" class="btn btn-rounded btn-primary mb-5" value="Add New">
                                    </div>
                                </form>


                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>


            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->

    </div>




@endsection
