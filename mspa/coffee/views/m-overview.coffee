define ['async!http://maps.google.com/maps/api/js?v=3&sensor=false'], (gmaps) ->
  class OverviewView
    render: (id) ->
      gmaps = window.google.maps
      console.log gmaps
      showMap = () ->
        mapcanvas = $('#' + id + ' .map-canvas')
        mapopts = {
          center: new gmaps.LatLng(-34.397, 150.644)
          zoom: 8
          mapTypeId: gmaps.MapTypeId.ROADMAP
        }
        console.log mapcanvas[0]
        mapcanvas.css('height', '50%')
        mapcanvas.css('width', '50%')
        map = new gmaps.Map(mapcanvas[0], mapopts)
      if $('#' + id ).hasClass('active')
        showMap()
      $('a[href="#' + id + '"]').on 'shown', (e) ->
        showMap()
