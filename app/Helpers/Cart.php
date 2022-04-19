<?php

namespace App\Helpers;
use Illuminate\Support\Arr;


use App\Product;

class Cart
{
    public function __construct()
    {
        if($this->get() === null)
            $this->set($this->empty());
    }

    public function search_product($carts, $productId)
    {
        foreach ($carts['products'] as $index => $cart){
            if($cart->id == $productId){
                return $cart;
            }
        }
        
        return false;
    }

    public function add(Product $product): void
    {
        $cart = $this->get();
        // Cek di Cart udah ada barang yang sama maka ganti unit_weight
        // $alreadyCart = array_search($product->id, array_column($cart['products'], 'id'));
        $alreadyCart = $this->search_product($cart, $product->id);
        // dd($cart);
        if($alreadyCart){ 
            
            $alreadyCart->unit_weight+=$product->unit_weight;

        }else{
            array_push($cart['products'], $product);
            $this->set($cart);
        }
    }

    public function remove(int $productId): void
    {
        $cart = $this->get();
        array_splice($cart['products'], array_search($productId, array_column($cart['products'], 'id')), 1);
        $this->set($cart);
    }

    public function clear(): void
    {
        $this->set($this->empty());
    }

    public function empty(): array
    {
        return [
            'products' => [],
        ];
    }

    public function get(): ?array
    {
        return request()->session()->get('cart');
    }

    private function set($cart): void
    {
        request()->session()->put('cart', $cart);
    }
}