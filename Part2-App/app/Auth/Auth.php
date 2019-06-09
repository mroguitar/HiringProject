<?php


namespace App\Auth;

use App\Models\User;


class Auth
{

  // Grap currently logged in user
  public function user() 
  {

    return User::find($_SESSION['user']); 

  }
  // Check if user is logged in
  public function check() 
  {

  	return isset($_SESSION['user']);

  }
  // Attempt to log user in
  public function attempt($email, $password)
  {

  	$user = User::where('email', $email)->first();

  	if (!$user) {
  	  return false;
  	}

  	if (password_verify($password, $user->password)) {

  	  $_SESSION['user'] = $user->id;

  	  return true;
  	}

  	return false;

  }

  public function logout() 
  {

    unset($_SESSION['user']);

  }

}