'use strict';require.config({
  shim: {
    underscore: {
      exports: '_'
    },
    backbone: {
      deps: ['underscore'],
      exports: 'Backbone'
    }
  },
  paths: {
    async: '../vendors/async',
    underscore: '../vendors/underscore',
    backbone: '../vendors/backbone',
    bootstrap: "../vendors/bootstrap.min",
    route: 'route',
    uri: '../vendors/URIjs',
    controllers: '../controllers',
    models: '../models',
    views: '../views'
  }
});

require(['route', 'bootstrap'], function(Router) {
  return console.log(Router);
});
