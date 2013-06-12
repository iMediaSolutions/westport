define(['models/namespace'], function(namespace) {
  var Incident;
  return Incident = (function() {
    function Incident(id) {
      this.id = id;
    }

    Incident.prototype.init = function(id, dat) {
      var geocoder, inits, showAddress;
      $('#' + id + ' .inc').text(dat.id);
      $('#' + id + ' .code').attr('value', Incident.prototype.find_latest(dat.incident_datas, 'code')).blur(function() {
        return $.getJSON('/api/update_incident?id=' + dat.id + '&code=' + $(this).val(), function(dat) {
          return $.getJSON('/api/get_incident.json', function(dat) {
            return namespace.incidents = dat;
          });
        });
      });
      $('#' + id + ' .loc').attr('value', Incident.prototype.find_latest(dat.incident_datas, 'loc')).blur(function() {
        showAddress($(this).val());
        return $.getJSON('/api/update_incident?id=' + dat.id + '&loc=' + $(this).val(), function(dat) {
          return $.getJSON('/api/get_incident.json', function(dat) {
            return namespace.incidents = dat;
          });
        });
      });
      $('#' + id + ' .status').attr('value', Incident.prototype.find_latest(dat.incident_datas, 'status')).blur(function() {
        return $.getJSON('/api/update_incident?id=' + dat.id + '&status=' + $(this).val(), function(dat) {
          return $.getJSON('/api/get_incident.json', function(dat) {
            return namespace.incidents = dat;
          });
        });
      });
      $('#' + id + ' .date').text(new Date(dat.created_at).toLocaleString());
      $('#' + id + ' .description').append(Incident.prototype.find_latest(dat.incident_datas, 'desc')).blur(function() {
        return $.getJSON('/api/update_incident?id=' + dat.id + '&desc=' + $(this).val(), function(dat) {
          return $.getJSON('/api/get_incident.json', function(dat) {
            return namespace.incidents = dat;
          });
        });
      });
      $('#' + id + ' .reporter').attr('value', Incident.prototype.find_latest(dat.incident_datas, 'reporter')).blur(function() {
        return $.getJSON('/api/update_incident?id=' + dat.id + '&reporter=' + $(this).val(), function(dat) {
          return $.getJSON('/api/get_incident.json', function(dat) {
            return namespace.incidents = dat;
          });
        });
      });
      $.getJSON('/api/get_staff', function(val) {
        $.each(val, function(key, vals) {
          $('#' + id + ' .responder').append('<option value="' + vals.id + '">' + vals.position + ' ' + vals.name + '</option>');
          return $('#' + id + ' .dispatcher').append('<option value="' + vals.id + '">' + vals.position + ' ' + vals.name + '</option>');
        });
        $('#' + id + ' .responder').val(Incident.prototype.find_latest(dat.incident_datas, 'responder_id')).blur(function() {
          return $.getJSON('/api/update_incident?id=' + dat.id + '&responder_id=' + $(this).val(), function(dat2) {
            return $.getJSON('/api/get_incident.json', function(dat3) {
              return namespace.incidents = dat3;
            });
          });
        });
        return $('#' + id + ' .dispatcher').val(Incident.prototype.find_latest(dat.incident_datas, 'dispatcher_id')).blur(function() {
          return $.getJSON('/api/update_incident?id=' + dat.id + '&dispatcher_id=' + $(this).val(), function(dat2) {
            return $.getJSON('/api/get_incident.json', function(dat3) {
              console.log(dat);
              return namespace.incidents = dat3;
            });
          });
        });
      });
      inits = function() {
        var mapOptions;
        mapOptions = {
          zoom: 8,
          center: new google.maps.LatLng(-34.397, 150.644),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        return this.map = new google.maps.Map($('#' + id + ' .map')[0], mapOptions);
      };
      inits();
      geocoder = new google.maps.Geocoder();
      showAddress = function(add) {
        return geocoder.geocode({
          address: add
        }, function(res, stat) {
          var loc, marker;
          if (stat === google.maps.GeocoderStatus.OK) {
            this.map.setCenter(res[0].geometry.location);
            this.map.setZoom(15);
            loc = res[0].geometry.location;
            return marker = new google.maps.Marker({
              map: this.map,
              animation: google.maps.Animation.DROP,
              position: loc,
              title: "Incident: " + dat.id
            });
          } else {
            return console.log(stat);
          }
        });
      };
      return showAddress(Incident.prototype.find_latest(dat.incident_datas, 'loc'));
    };

    Incident.prototype.find_latest = function(dat, key) {
      var found, latest;
      found = [];
      $.each(dat, function(ky, value) {
        if (value.incident_type.name === key) {
          return found.push(value);
        }
      });
      latest = found[0];
      $.each(found, function(ky, value) {
        if (new Date(latest.created_at).getTime() < new Date(value.created_at).getTime()) {
          return latest = value;
        }
      });
      if (latest === void 0 || latest.value === void 0) {
        latest = {};
        latest.value = '';
      }
      return latest.value;
    };

    return Incident;

  })();
});
