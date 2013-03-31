define(['async!http://maps.google.com/maps/api/js?v=3&sensor=false'], function(gmaps) {
  var OverviewView;

  return OverviewView = (function() {
    function OverviewView() {}

    OverviewView.prototype.render = function(id) {
      var showMap;

      gmaps = window.google.maps;
      console.log(gmaps);
      showMap = function() {
        var map, mapcanvas, mapopts;

        mapcanvas = $('#' + id + ' .map-canvas');
        mapopts = {
          center: new gmaps.LatLng(-34.397, 150.644),
          zoom: 8,
          mapTypeId: gmaps.MapTypeId.ROADMAP
        };
        console.log(mapcanvas[0]);
        mapcanvas.css('height', '50%');
        mapcanvas.css('width', '50%');
        return map = new gmaps.Map(mapcanvas[0], mapopts);
      };
      if ($('#' + id).hasClass('active')) {
        showMap();
      }
      return $('a[href="#' + id + '"]').on('shown', function(e) {
        return showMap();
      });
    };

    return OverviewView;

  })();
});
