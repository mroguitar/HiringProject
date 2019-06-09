<?php

namespace App\Controllers;

use App\Models\Assessment;

use App\Models\Scores;


class Assess 
{

	public function getRandomQuestion($questionIdArray) 
  {

  	  $randomQuestion = Assessment::select('questionId','questionText')->OrderByRaw("RAND()")->whereNotIn('questionId', $questionIdArray)->limit(1)->get();

  	  return $randomQuestion;
  }


  public function getCorrect($question, $answer) 
  {
    $toMatch = '';
    $result  = '';
    $json    = '';
    $textToMatch = '';

     $textToMatch = Assessment::select('InterestAreaName')->where('questionText', $question)->get();


     $json = json_encode($textToMatch);
      
     $result = json_decode($json);

     foreach($result as $obj) {

     	 $toMatch = $obj->InterestAreaName;

     }
  	 
     
     if ( $toMatch == $answer ) {
       return 'true';
     } else {
       return 'false';
     }

  }

  public function recordScore($score)
  {


    $userId = $_SESSION['user'];

    $JohnDoe = Scores::where('userId', $userId)->first();

    $JohnDoe->score = $score;

    $JohnDoe->save();

    return 'successfully recorded score';


  }

} 