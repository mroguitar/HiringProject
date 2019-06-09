<?php


namespace App\Models;


use Illuminate\Database\Eloquent\Model;

class Usage extends Model
{

   // Use if table naming differs from standard naming convention
	protected $table = 'usage_log';

	protected $fillable = [
	  'userId',
	  'sessionId',
	  'login',
	  'logout',
	];

}