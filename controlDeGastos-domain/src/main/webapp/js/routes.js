'use strict';

app.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider
    .state('login', {
      url: '/login',
      templateUrl: 'templates/login.html',
      controller: 'LoginController as loginCtrl'
    })

    .state('registro', {
      url: '/registracion',
      templateUrl: 'templates/registro.html',
      controller: 'RegistroController as registroCtrl'
    })

    .state('main', {
      url: '/lobby',
      views: {
        // the main template will be placed here (relatively named)
        '': { templateUrl: 'templates/mainPage.html' },
        // the child views will be defined here (absolutely named)
        'tradeFeed@bulletinBoard': { template: '<div><h2>hola mundo</h2></div>'},
        // another child view
        'newsFeed@bulletinBoard': { 
            template:'<div><h3>hola2</h3></div>'
        }
      }
    });
});


/*
.state('newsFeedView', {
      url: '/newsFeed',
      //controller: 'newsFeedController',
      templateUrl: 'templates/registroUsuario.html',
    })
    
    .state('tradeFeedView', {
      url: '/tradeFeed',
      //controller: 'tradeFeedController',
      templateUrl: 'templates/login.html',

    })*/