@extends('admin.admin_master')
@section('admin')


    <!-- Content Wrapper. Contains page content -->

    <div class="container-full">
        <!-- Content Header (Page header) -->


        <!-- Main content -->
        <section class="content">
            <div class="row">


                <!--   ------------ Add Coupon Page -------- -->


                <div class="col-12">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">{{ trans("admin.Edit Coupon")   }} </h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="table-responsive">


                                <form method="post" action="{{ route('coupon.update',$coupons->id) }}">
                                    @csrf


                                    <div class="form-group">
                                        <h5>{{ trans("admin.Coupon Name")   }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="coupon_name" class="form-control"
                                                   value="{{ $coupons->coupon_name }}">
                                            @error('coupon_name')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.Coupon Discount") }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="coupon_discount" class="form-control"
                                                   value="{{ $coupons->coupon_discount }}">
                                            @error('coupon_discount')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.coupon_discount_type")   }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="coupon_discount_type" class="form-control"
                                                   value="{{ $coupons->coupon_discount_type }}">
                                            @error('coupon_discount_type')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.model_name")   }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="model_name" class="form-control"
                                                   value="{{ $coupons->model_name }}">
                                            @error('model_name')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.model_id")   }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="model_id" class="form-control"
                                                   value="{{ $coupons->model_id }}">
                                            @error('model_id')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.Coupon Started Date") }} <span class="text-danger">*</span>
                                        </h5>
                                        <div class="controls">
                                            <input type="date" name="started_at" class="form-control"
                                                   min="{{ Carbon\Carbon::now()->format('Y-m-d') }}"
                                                   value="{{ $coupons->started_at }}">
                                            @error('started_at')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.message_before_started_at")   }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="message_before_started_at" class="form-control"
                                                   value="{{ $coupons->message_before_started_at }}">
                                            @error('message_before_started_at')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.Coupon Expired Date") }} <span class="text-danger">*</span>
                                        </h5>
                                        <div class="controls">
                                            <input type="date" name="expired_at" class="form-control"
                                                   min="{{ Carbon\Carbon::now()->format('Y-m-d') }}"
                                                   value="{{ $coupons->expired_at }}">
                                            @error('expired_at')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <h5>{{ trans("admin.message_after_expired_at")   }} <span class="text-danger">*</span></h5>
                                        <div class="controls">
                                            <input type="text" name="message_after_expired_at" class="form-control"
                                                   value="{{ $coupons->message_after_expired_at }}">
                                            @error('message_after_expired_at')
                                            <span class="text-danger">{{ $message }}</span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="text-xs-right">
                                        <input type="submit" class="btn btn-rounded btn-primary mb-5" value="Update">
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
