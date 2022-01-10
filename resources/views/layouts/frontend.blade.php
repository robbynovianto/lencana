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

        *{
    margin: 0;
    padding: 0;
    color: #d9d9d9;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

footer{
    position: relative;
    bottom: 0px;
    width: 100%;
    background: #111;
}

.main-content{
    display: flex; 
}

.main-content .box{
    flex-basis: 50%;
    padding: 10px 20px;
}

.box h2{
    font-size:1.125rem;
    font-weight: 600;
    text-transform: uppercase;
}

.box content{
    margin: 20px 0 0 0;
}

.left .content .social{
    padding: 20px 0 0 0;
}

.left .content p{
    text-align: justify;
}

.left .content .social a{
    padding: 0 2px;
}

.left .content .social a span{
    height: 40px;
    width: 40px;
    background: #1a1a1a;
    line-height: 40px;
    text-align: center;
    font-size: 18px;
    border-radius: 5px;
    transition: 0.3s;
}
.left .content .social a span:hover{
    background: #f12020;
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
            <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup=“true" aria-expanded="false"> Kategori
            </a>
            <div class="dropdown-menu border-0 shadow-sm dropdown-menu-right” aria-labelledby="navbarDropdownMenuLink">
            @foreach ($global_categories as $category)
                <a class="dropdown-item" href="/category/{{ $category->slug }}"><img src="{{ Storage::url('public/categories/'.$category->image) }}" class=“rounded" style="width: 20px"> {{ $category->name }}</a>
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
<footer>
    <div class="main-content">
        <div class="left box">
            <h2>About us</h2>
            <div class="content">
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Omnis autem enim voluptates nesciunt error quae nobis, 
                    culpa, neque expedita, quisquam sequi. Ut delectus, quasi similique assumenda minus voluptatum eaque consectetur.</p>
            <div class="social">    
                <a href="#"><span class="fab fa-facebook-f"></span></a>
                <a href="#"><span class="fab fa-twitter"></span></a>
                <a href="#"><span class="fab fa-instagram"></span></a>
            </div>
            </div>  
        </div>
        <div class="center box">
            <h2>Address</h2>
            <div class="content">
                <div class="place">
                    <span class="fas fa-map-marker-alt"></span>
                    <span class="text">Ds. Ledok Demaan RT3/5 no 885, Kudus</span>
                </div>
                <div class="phone">
                    <span class="fas fa-phone-alt"></span>
                    <span class="text">+6287730799869</span>
                </div>
                <div class="email">
                    <span class="fas fa-envelope"></span>
                    <span class="text">abc@example.com</span>
                </div>
            </div>
        </div>
        <div class="right box">
            <h2>Contact us</h2>
            <div class="content">
                <form action="#">
                    <div class="email">
                        <div class="text">Email *</div>
                        <input type="email" required>
                    </div>
                    <div class="msg">
                        <div class="text">Message *</div>
                        <textarea cols="25" rows="2" required></textarea>
                    </div>
                    <div class="btn">
                        <button type="submit">Send</button>
                    </div>
                </form>
            </div>
        </div>
</div>
</footer>
</html>