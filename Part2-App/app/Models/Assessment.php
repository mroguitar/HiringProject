<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Assessment extends Model
{

   // Use if table naming differs from standard naming convention
	protected $table = 'assessment';

	protected $fillable = [
	  'questionId',
	  'questionText',
	  'InAreaId',
	  'InterestAreaName',
	];

}