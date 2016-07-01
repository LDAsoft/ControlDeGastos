'use strict';

app.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/login");

  $stateProvider
    .state('login', {
      url: '/login',
      templateUrl: 'templates/login.html',
      controller: 'LoginController as loginCtrl',
      data: {},
      resolve: {}
    })

    .state('registro', {
      url: '/registracion',
      templateUrl: 'templates/registro.html',
      controller: 'RegistroController as registroCtrl',
      data: {},
      resolve: {}
    });
});
