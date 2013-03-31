requirejs.config({
    appDir: ".",
    baseUrl: "js",
    paths: {
        /* Load jquery from google cdn. On fail, load local file. */
        'jquery': ['wq//code.jquery.com/jquery-1.9.1.min.js','vendors/jquery-min'],
        /* Load bootstrap from cdn. On fail, load local file. */
        'bootstrap': ['//netdna.bootstrapcdn.com/twitter-bootstrap/2.2.1/js/bootstrap.min',,'vendors/bootstrap-min']
    },
    shim: {
        /* Set bootstrap dependencies (just jQuery) */
        'bootstrap' : ['jquery']
    }
});

require([
    'jquery', 'bootstrap',
],
function($){
    console.log("Loaded :)");
    return {};
});
