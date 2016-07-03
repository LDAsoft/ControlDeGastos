'use strict';

gastosApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider
    .state('login', {
      url: '/',
      templateUrl: 'templates/login.html',
      controller: 'UsuarioController'
    })

    .state('registro', {
      url: '/registracion',
      templateUrl: 'templates/registroUsuario.html',
      controller: 'UsuarioController'
    })

    .state('mainPage', {
      url: '/mainPage',
      views: {
        '': { templateUrl: 'templates/mainPage.html', controller: 'MainController'},
        'panelIzq@mainPage': { 
          templateUrl: 'templates/panelIzq.html', controller: 'MainController'},

        'panelCentral@mainPage': { 
          templateUrl: 'templates/panelCentral.html', controller: 'MainController'
        },
        'panelDer@mainPage': { 
          template:'<div><h3>Aca va el indice inflacionario y los detalles de inflacion</h3></div>',controller: 'MainController'
        }
      }
    });
});