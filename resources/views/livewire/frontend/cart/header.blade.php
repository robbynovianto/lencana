
    <ul class="nav navbar-nav navbar-right ml-auto">
    <li class="nav-item ml-1 mr-3">
        <a href="{{ route('frontend.cart.index') }}" 
        class="btn btn-md btn-outline-dark btn-block" 
        style="color: #333;background-color: #FAFAFA;">
        <i class="fa fa-shopping-cart"></i> {{ $cartTotal }} | {{ money_id($cartTotalPrice) }}</a>
    </li>
</ul>
