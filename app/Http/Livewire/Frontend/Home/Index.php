<?php

namespace App\Http\Livewire\Frontend\Home;

use App\Slider;
use App\Product;
use App\Facades\Cart;
use Livewire\Component;
use SebastianBergmann\Environment\Console;

class Index extends Component
{
    public $perPage  = 12;

    public function loadMore()
    {
        $this->perPage = $this->perPage + 4;
    }

    /**
     * add To Cart
     */
    public function addToCart(int $productId)
    {
        Cart::add(Product::where('id', $productId)->first());
        $this->emit('addToCart');
        //alert message
        $this->emit('alert', ['type' => 'success', 'message' => 'Product added to cart.']);
    }

    public function render()
    {
        $products = Product::latest()->paginate($this->perPage);

        return view('livewire.frontend.home.index', [
            'sliders'   => Slider::latest()->get(),
            'products'  => $products
        ]);
    }
}
