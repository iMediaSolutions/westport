'use strict';
require.config({
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
    underscore: '../vendors/underscore',
    bootstrap: '../vendors/bootstrap.min',
    backbone: '../vendors/backbone',
    text: '../vendors/text',
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
