<?php


namespace App\Controllers;

use App\Models\Assessment;

//use Slim\Views\Twig as View;

use App\Controllers\BaseController;
 
class AssessmentController extends BaseController
{

  public function index($request, $response)
  {
  	if ( $_SESSION['user'] ) {

      return $this->view->render($response, 'assessment.twig');//$data

    } else {

      return $response->withStatus(404)->write(json_encode([
      	'error' => 'You must be signed in to view this page.'

      ]));
    }

  }

  public function getCount() 
  {

  	$rowCount = Assessment::count();

  	return $rowCount;
  }

  public function nextQuestion($request, $response) 
  { 

    //Get score
    $score = $request->getParam('score');

    // Means assessment is over
    $questionCount = $request->getParam('questionCount');
    // This is just a variable to control the length of test for testing purposes i.e. ($totalCount - $subtract) in elseif block below
    $subtract = 102;

    // Get total count of assessment so we know when to end
    $totalCount = $this->getCount();


    $questionIdArray = $request->getParam('questionIdArray');

    $answer = $request->getParam('sendAnswer');

    $question = $request->getParam('sendQuestion');

    // Send back to ajax call to keep track of correct/incorrect answers
    $correct = $this->assess->getCorrect($question,$answer);


    // If user beginning assessment
    if ( $question == 'Click Next To Begin') {
      $data = $this->assess->getRandomQuestion($questionIdArray);
      $data = json_decode($data);
      $data[1] = array('Beginning' => 'Beginning');
           
      return $response->withJSON($data);

    } elseif ( $questionCount == $totalCount ) { // If assessment is complete

      $finished_array[] = (object) array('Finished' => 'Finished', 'totalCount' => $totalCount, 'Correct' => $correct);

      return $response->withJSON($finished_array);

    } elseif ( isset($score) ) {
      
      $success = $this->assess->recordScore($score);

      return $response->withJSON($success);

    } else {


      $data = $this->assess->getRandomQuestion($questionIdArray);
      $data = json_decode($data);
      $data[1] = array('Correct' => $correct);

      return $response->withJSON($data);

    }
 

  }

  
}

