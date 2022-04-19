<div style="margin-top: 120px">
    <div class="container-fluid mb-lg-5 mt-4">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card border-0 shadow rounded-lg mb-4">
                    <div class="card-body p-3">
                        <h6 class="font-weight-bold"><i class="fa fa-list-ul"></i> GAMBAR</h6>
                        <hr>
                        <img src="{{ Storage::url('public/products/'.$product_image) }}" class="responsive" style="
                        width: 100%;
                        max-width: 700px;
                        height: auto;
                        ">
                    </div>
                </div>
            </div>
            <div class="col-md-7">

                <div class="card border-0 shadow rounded-lg">
                    <div class="card-body">
                        <h6 class="font-weight-bold"><i class="fa fa-shopping-cart"></i> DETAIL</h6>
                        <hr>
                        <h1 class="font-weight-bold">{{ $product_title}}</h1>
                        <table class="table table-borderless">
                        <tr>
                                <td style="width: 10%">
                                    Harga
                                </td>
                                <td style="width: 1%">:</td>
                                <td>
                                    {{$price}} / pcs
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%">
                                    Jumlah
                                </td>
                                <td style="width: 1%">:</td>
                                <td>
                                    {{$jumlah}} {{$unit}}
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%">
                                    Berat
                                </td>
                                <td style="width: 1%">:</td>
                                <td>
                                    {{$weight}} gram
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%">
                                    Kategori
                                </td>
                                <td style="width: 1%">:</td>
                                <td>
                                    <a href="/category/{{ $kategori }}" class="text-decoration-none text-blue font-weight-bold">{{$kategori}}
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 10%">
                                    Diskripsi
                                </td>
                                <td style="width: 1%">:</td>
                                <td>
                                    {!!$description!!}
                                </td>
                            </tr>
</table>
                            <button wire:click="addToCart({{ $id2 }})" class="btn btn-primary btn-md mt-3 btn-block shadow-md">Beli</button>