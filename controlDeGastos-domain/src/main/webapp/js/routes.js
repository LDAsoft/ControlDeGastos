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

    .state('lobby', {
      url: '/lobby',
      views: {
        '': { templateUrl: 'templates/mainPage.html', controller: 'MainController' },
        'panelIzq@lobby': { 
          templateUrl: 'templates/panelIzq.html', controller: 'MainController'
        },


        'panelCentral@lobby': { 
          template:'<div><h3>Aca va lo de buscar gasto por filtro y la tabla del detalle</h3></div>',controller: 'MainController'
        },
        'panelDer@lobby': { 
          template:'<div><h3>Aca va el indice inflacionario y los detalles de inflacion</h3></div>',controller: 'MainController'
        }
      }
    });
});