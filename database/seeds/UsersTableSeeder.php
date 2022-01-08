<?php

use App\User;
use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $user = User::create([
            'name'      => 'Robby Novianto',
            'email'     => 'robbynovianto33@gmail.com',
            'password'  => bcrypt('veezkun99')
        ]);
    }
}
