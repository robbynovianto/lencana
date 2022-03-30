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
    //     $product = Product::findOrFail($productId);
    //     // dd($product['image']);
    //     $cart = session()->get('cart',[]);

    //     if(!$cart) {
    //         $cart = [
    //                 $products => [
    //                     "id" => $product->id,
    //                     "image" => $product->image,
    //                     "title" => $product->title,
    //                     "slug" => $product->slug,
    //                     "category_id" => $product->category_id,
    //                     "content" => $product->content,
    //                     "unit" => $product->unit,
    //                     "unit_weight" => 1,
    //                     "weight" => $product->weight,
    //                     "price" => $product->price,
    //                     "discount" => $product->discount,
    //                     "keywords" => $product->keywords,
    //                     "description" => $product->description,
    //                     "created_at" => $product->created_at,
    //                     "updated_at" => $product->updated_at
    //                 ]
    //         ];
    //         session()->put('cart', $cart);
            
    //     }
    //     // if cart not empty then check if this product exist then increment quantity
    //     if(isset($cart[$productId])) {
    //         $cart[$productId]['unit_weight']++;
    //         session()->put('cart', $cart);
            
    //     }
    //     // if item not exist in cart then add to cart with quantity = 1
    //     $cart['products'] = [
    //         $productId => [
    //             "id" => $product->id,
    //             "image" => $product->image,
    //             "title" => $product->title,
    //             "slug" => $product->slug,
    //             "category_id" => $product->category_id,
    //             "content" => $product->content,
    //             "unit" => $product->unit,
    //             "unit_weight" => 1,
    //             "weight" => $product->weight,
    //             "price" => $product->price,
    //             "discount" => $product->discount,
    //             "keywords" => $product->keywords,
    //             "description" => $product->description,
    //             "created_at" => $product->created_at,
    //             "updated_at" => $product->updated_at
    //         ]
    // ];
        // session()->put('cart', $cart);
        // dd($cart);
        // $this->emit('alert', ['type' => 'success', 'message' => 'Product added to cart.']);


        // $cart = session()->get('cart', []);
        // $totalCart = count($cart['products']);
        // for($a=0;$a < $totalCart;$a++){
        //     $cekCart[] = $cart['products'][$a]['id'];

        //     if($cekCart[$a] == $productId){
                
        //         dd($cekCart);
        //     }
        // }

        Cart::add(Product::where('id', $productId)->first());
        $this->emit('addToCart');
        //alert message
        $this->emit('alert', ['type' => 'success', 'message' => 'Product added to cart.']);
    // }
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
