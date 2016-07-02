'use strict';

gastosApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/log");

  $stateProvider
    .state('login', {
      url: '/log',
      templateUrl: 'templates/login.html',
      controller: 'UsuarioController'
    })

    .state('lobbyOld', {
      url: '/lobbyOld',
      templateUrl: 'templates/mainPage.html',
      controller: 'MainController'
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
          template: '<div><h2>Aca va lo de agregar nuevo gasto</h2></div>', controller: 'MainController'
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