<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class User extends Model
{

   // Use if table naming differs from standard naming convention
	protected $table = 'users';

	protected $fillable = [
	  'fName',
	  'lName',
	  'age',
	  'email',
	  'password',
	];

}