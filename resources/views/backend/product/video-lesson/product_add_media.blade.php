@extends('admin.admin_master')
@section('admin')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <div class="container-full">

        <section class="content">
            <div class="row">

                <div class="col-md-12">
                    <div class="box bt-3 border-info">
                        <div class="box-header">
                            <h4 class="box-title">Product VideoLesson Upload</h4>
                        </div>

                        <form method="post" action="{{ route('product.video_lessons.store.item', $productId) }}"
                              enctype="multipart/form-data">
                            @csrf
                            <div class="text-xs-right">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="">Name:</label>
                                            <input type="" name="name" class="form-control"
                                                   placeholder="Enter Lesson Name">
                                            @if ($errors->has('name'))
                                                <span class="text-danger">{{ $errors->first('name') }}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row d-none">
                                    <div class="col-md-12 mb-3">
                                        <label for="">product_id:</label>
                                        <input type="" name="product_id" class="form-control" value="{{$productId}}"
                                               placeholder="Enter Lesson Name">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <label for="">order:</label>
                                        <input type="number" name="order" class="form-control" value="0"
                                               placeholder="Enter Order Name">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <label for="">is free:</label>
                                        <input type="number" name="is_free" class="form-control"
                                               value="0"
                                               placeholder="Enter is free">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <label for="">minutes:</label>
                                        <input type="number" name="minutes" class="form-control"
                                               value="0"
                                               placeholder="Enter minutes">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <label for="">Video:</label>
                                        <input type="file" name="media" class="form-control">
                                        @if ($errors->has('media'))
                                            <span class="text-danger">{{ $errors->first('media') }}</span>
                                        @endif
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-rounded btn-primary mb-5" value="Upload">
                            </div>
                            <br><br>
                        </form>
                    </div>
                </div>

            </div> <!-- // end row  -->

        </section>

    </div>

@endsection
