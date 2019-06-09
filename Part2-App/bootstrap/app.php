<?php

use Respect\Validation\Validator as v;

session_start();


require __DIR__ . '/../vendor/autoload.php';


$app = new \Slim\App([
  'settings' => [
  	'displayErrorDetails' => true,
  ],
  'db' => [
  	'driver' => 'mysql',
  	'host' => 'localhost',
  	'database' => 'testing',
  	'username' => 'testuser',
  	'password' => 'Welcome123',
  	'charset' => 'utf8',
  	'collation' => 'utf8_unicode_ci',
  	'prefix' => '',

  ]

]);


$container = $app->getContainer();

$capsule = new \Illuminate\Database\Capsule\Manager;

$capsule->addConnection($container['db']);

$capsule->setAsGlobal();

$capsule->bootEloquent();

$container['db'] = function($container) use ($capsule) {
  return $capsule;
};

$container['auth'] = function ($container) {
  return new \App\Auth\Auth;
};

$container['assess'] = function($container) {
  return new \App\Controllers\Assess;
};

$container['flash'] = function ($container) {
  return new \Slim\Flash\Messages;
};

$container['view'] = function($container) {
  $view = new \Slim\Views\Twig(__DIR__ . '/../resources/views', [
  	'cache' => false,
  ]);

  $view->addExtension(new \Slim\Views\TwigExtension(
  	$container->router,
  	$container->request->getUri()
  ));


  $view->getEnvironment()->addGlobal('auth', [

    'check' => $container->auth->check(),
    'user' => $container->auth->user(),

  ]);

  $view->getEnvironment()->addGlobal('assess', [
    'getRandomQuestion' => $container->assess->getRandomQuestion(),
  ]);

  $view->getEnvironment()->addGlobal('flash', $container->flash);


  return $view;

};

$container['count'] = function($container) {
  $count = 0;
  return $count;
};

$container['validator'] = function($container) {

  return new \App\Validation\Validator;

};


$container['AssessmentController'] = function ($container) {

  return new \App\Controllers\AssessmentController($container);

};

$container['AuthController'] = function ($container) {

  return new \App\Controllers\Auth\AuthController($container);

};

$container['csrf'] = function ($container) {
  $csrf = new \Slim\Csrf\Guard;
  $csrf->setPersistentTokenMode(true);
  return $csrf;
};

// Add Middleware
$app->add(new \App\Middleware\ValidationErrorsMiddleware($container));

$app->add(new \App\Middleware\OldInputMiddleware($container));

$app->add(new \App\Middleware\CsrfViewMiddleware($container));




$app->add($container->csrf);

v::with('App\\Validation\\Rules\\');

require __DIR__ . '/../app/routes.php';