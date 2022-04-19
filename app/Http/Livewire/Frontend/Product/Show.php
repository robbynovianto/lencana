<?php

namespace App\Http\Livewire\Frontend\Product;

use App\Product;
use App\Category;
use App\Facades\Cart;
use Livewire\Component;
use Illuminate\Http\Request;

class Show extends Component
{

    public $segment;
    public $category_name;
    public $category_image;

    public function mount(Request $request)
    {
        $this->segment = $request->segment(2);
    }

    public function addToCart(int $productId)
    {

            
        Cart::add(Product::where('id', $productId)->first());
        $this->emit('addToCart');
        //alert message
        $this->emit('alert', ['type' => 'success', 'message' => 'Product added to cart.']);
    // }
        }
    
    public function render()
    {   

        $products = Product::where('id', $this->segment)->first();

        return view('livewire.frontend.product.show', [
            'products'  => $products,
            'id2'               => $products->id,
            'product_image'    => $products->image,
            'product_title'    => $products->title,
            'unit'             => $products->unit,
            'kategori'         => $products->category->name,
            'jumlah'           => $products->unit_weight,
            'weight'           => $products->weight,
            'price'            => $products->price,
            'description'      => htmlspecialchars_decode($products->content)


        ]);
    }

}