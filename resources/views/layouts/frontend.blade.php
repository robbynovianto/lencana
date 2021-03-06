<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>R-Dua Lencana | Jual Lencana</title>
    <link rel="shortcut icon" href="{{ asset('images/favicon.ico') }}" type="image/x-icon" />
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet" />    
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">
    <link rel="stylesheet" href="css/footer.css">
    <livewire:styles />
    <livewire:scripts />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
    <script src="{{ mix('js/app.js') }}"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }

    </style>
</head>

<body style="background-color: #FAFAFA;">

<nav class="navbar navbar-expand-lg fixed-top navbar-light bg-light"
        style="background-color: #FAFAFA!important;">
        <a href="/" class="navbar-brand font-weight-bold"><i class="fa fa-shopping-bag"></i> R-DUA STORE</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/">Beranda <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
            <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup=???true" aria-expanded="false"> Kategori
            </a>
            <div class="dropdown-menu border-0 shadow-sm dropdown-menu-right??? aria-labelledby="navbarDropdownMenuLink">
            @foreach ($global_categories as $category)
                <a class="dropdown-item" href="/category/{{ $category->slug }}"><img src="{{ Storage::url('public/categories/'.$category->image) }}" class=???rounded" style="width: 20px"> {{ $category->name }}</a>
            @endforeach
            </div>
        </li>    
    <li class="ml-2">
    <form class="navbar-nav mr-auto" action="{{ route('frontend.search.index') }}">
      <input class="form-control mr-sm-2" type="text" name="q" placeholder="Cari disini..." aria-label="Search">
      <button class="btn text-dark border my-2 my-sm-0" type="submit">Cari</button>
    </form>
    </li>
    </ul>
    <ul class="nav navbar-nav navbar-right ml-auto">
                
                <!-- cart -->
                <livewire:frontend.cart.header/>
                <!-- end cart -->

                @if (Auth::guard('customer')->check())
                <ul class="navbar-nav d-none d-md-block ml-4">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle font-weight-bold text-black" href="#" id="navbarDropdown"
                            role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user-circle"></i> {{ Auth::guard('customer')->user()->name }}
                        </a>
                        <div class="dropdown-menu border-0 shadow" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="/customer/dashboard"><i
                                    class="fa fa-tachometer-alt"></i> DASHBOARD</a>
                            <a class="dropdown-item" href="/customer/orders"><i class="fa fa-shopping-cart"></i> MY ORDERS</a>
                            <div class="dropdown-divider"></div>
                            <livewire:customer.auth.logout />
                        </div>
                </ul>
                @else
                <li class="nav-item">
                    <a href="/customer/login" class="btn btn-md shadow btn-outline-dark btn-block"
                        style="color: #fff;background-color: #343a40;border-color: #343a40;"><i
                            class="fa fa-user-circle"></i> ACCOUNT</a>
                </li>
                @endif
            </ul>
        </div>
  </div>

  
</nav>

    @if (Auth::guard('customer')->check() && request()->segment(1) == "customer")
    <div class="jumbotron rounded-0" style="background-color: #4889e5; padding-bottom:8rem">
        <div class="container">
        </div>
    </div>
    @endif

    <div class="container-fluid mb-5">

        @yield('content')

    </div>



    <script>
        @if(session()->has('success'))
            toastr.success('{{ session('success') }}')
        @elseif(session()->has('error'))
            toastr.error('{{ session('error') }}')
        @endif

        window.livewire.on('alert', param => {
            toastr[param['type']](param['message']);
            toastr.options.preventDuplicates = true;
        });


        document.addEventListener("DOMContentLoaded", function(){
        // make it as accordion for smaller screens
        if (window.innerWidth > 992) {

            document.querySelectorAll('.navbar .nav-item').forEach(function(everyitem){

                everyitem.addEventListener('mouseover', function(e){

                    let el_link = this.querySelector('a[data-bs-toggle]');

                    if(el_link != null){
                        let nextEl = el_link.nextElementSibling;
                        el_link.classList.add('show');
                        nextEl.classList.add('show');
                    }

                });
                everyitem.addEventListener('mouseleave', function(e){
                    let el_link = this.querySelector('a[data-bs-toggle]');

                    if(el_link != null){
                        let nextEl = el_link.nextElementSibling;
                        el_link.classList.remove('show');
                        nextEl.classList.remove('show');
                    }


                })
            });

        }
        // end if innerWidth
        }); 
        // DOMContentLoaded  end

    </script>
</body>

<script src="https://app.sandbox.midtrans.com/snap/snap.js" data-client-key="{{config('services.midtrans.clientKey')}}"></script>
</footer>
</html>