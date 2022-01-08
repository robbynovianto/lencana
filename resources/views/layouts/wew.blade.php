    <nav class="navbar navbar-expand-md fixed-top navbar-light bg-light text-black mb-5"
        style="background-color: #FAFAFA!important;">
        <a href="/" class="navbar-brand font-weight-bold"><i class="fa fa-shopping-bag"></i> R-DUA STORE</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-sk">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="navbar-collapse collapse" id="navbar-sk">
            <!-- categories -->
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup=“true" aria-expanded="false"><i class="fa fa-list-ul"></i> CATEGORIES
                    </a>
                    <div class="dropdown-menu border-0 shadow-sm dropdown-menu-right” aria-labelledby="navbarDropdownMenuLink">
                    @foreach ($global_categories as $category)
                        <a class="dropdown-item" href="/category/{{ $category->slug }}"><img src="{{ Storage::url('public/categories/'.$category->image) }}" class=“rounded" style="width: 20px"> {{ $category->name }}</a>
                    @endforeach
                    </div>
                </li>
            </ul>
            <!-- end categories -->

            <!-- search -->
            <div class="mx-2 my-auto d-inline" style="width: 20%">
                <form action="{{ route('frontend.search.index') }}">
                        <div class="input-group">
                                <input type="text" name="q" class="form-control border border-right-0" placeholder="Search...">
                                <span class="input-group-append">
                                    <button class="btn text-dark border border-left-0" style="background-color: white" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                        </div>
                </form>
            </div>
            <!-- end search -->

            <ul class="nav navbar-nav navbar-right ml-auto">
                
                <!-- cart -->
                <livewire:frontend.cart.header/>
                <!-- end cart -->

                @if (Auth::guard('customer')->check())
                <ul class="navbar-nav d-none d-md-block ml-4">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle font-weight-bold text-white" href="#" id="navbarDropdown"
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

    </nav>