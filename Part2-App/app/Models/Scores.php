<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Scores extends Model
{

   // Use if table naming differs from standard naming convention
	protected $table = 'scores';

	protected $fillable = [
	  'userId',
	  'score',
	];

}