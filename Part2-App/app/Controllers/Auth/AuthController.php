<?php


namespace App\Controllers\Auth;

use App\Models\User;

use App\Models\Usage;

use App\Models\Scores;
 
use App\Controllers\BaseController;

use Respect\Validation\Validator as v;


class AuthController extends BaseController
{

  public function getSignOut($request, $response) 
  { 

    $now = date('Y/m/d H:i:s', time());

    $userId = $_SESSION['user'];

    $record = Usage::where('userId', $userId)->whereNull('logout')->first();

    $record->logout = $now;

    $record->save();

    $this->auth->logout();

    return $response->withRedirect($this->router->pathFor('auth.signin'));

  }

  public function getSignIn($request, $response)
  {

    return $this->view->render($response, 'auth/signin.twig');

  }

  public function postSignin($request, $response) 
  {

    $auth = $this->auth->attempt(

      $request->getParam('email'),

      $request->getParam('password')

    );

    if (!$auth) {
      $this->flash->addMessage('error', 'Could not sign you in with those credentials!');

      return $response->withRedirect($this->router->pathFor('auth.signin'));
    }

    $userId    = $_SESSION['user'];

    $sessionId = session_id();

    $now       = date('Y/m/d H:i:s', time());

    $usageLog = Usage::create([
      'userId' => $userId,
      'sessionId' => $sessionId,
      'login' => $now,
    ]);

    return $response->withRedirect($this->router->pathFor('assessment'));

  }
  
  public function getSignUp($request, $response)
  {

    return $this->view->render($response, 'auth/signup.twig');

  }

  public function postSignUp($request, $response)
  {

  	$validation = $this->validator->validate($request, [
  		'fName' => v::notEmpty()->alpha(),
      'lName' => v::notEmpty()->alpha(),
      'age' => v::noWhitespace()->notEmpty()->numeric(),
      'email' => v::noWhitespace()->notEmpty()->email()->emailAvailable(),
  		'password' => v::noWhitespace()->notEmpty(),
  	]);

  	if ($validation->failed()) {
  	  return $response->withRedirect($this->router->pathFor('auth.signup'));
  	}


  	$user = User::create([
  	  'fName' => $request->getParam('fName'),
      'lName' => $request->getParam('lName'),
      'age'   => $request->getParam('age'),
      'email' => $request->getParam('email'),
      'password' => password_hash($request->getParam('password'), PASSWORD_DEFAULT),
  	  
  	]);

    $this->flash->addMessage('info', 'You have been signed up!');


    $this->auth->attempt($user->email, $request->getParam('password'));

    $userId    = $_SESSION['user'];

    $sessionId = session_id();

    $now       = date('Y/m/d H:i:s', time());

    $usageLog = Usage::create([
      'userId' => $userId,
      'sessionId' => $sessionId,
      'login' => $now,
    ]);

    $scores = Scores::create([
      'userId' => $userId,
    ]);


  	return $response->withRedirect($this->router->pathFor('assessment'));
  }

}