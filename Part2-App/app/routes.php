<?php

$app->get('/', 'AuthController:getSignUp')->setName('auth.signup');
$app->post('/', 'AuthController:postSignUp');

$app->get('/auth/signin', 'AuthController:getSignIn')->setName('auth.signin');
$app->post('/auth/signin', 'AuthController:postSignIn');

$app->get('/auth/signout', 'AuthController:getSignOut')->setName('auth.signout');

$app->get('/assessment', 'AssessmentController:index')->setName('assessment');
$app->post('/assessment', 'AssessmentController:nextQuestion');


