define(['text!/templates/incident.html', 'models/namespace'], function(inc, namespace) {
  var Table;
  return Table = (function() {
    function Table(id) {
      this.id = id;
    }

    Table.prototype.init = function(id, dat) {
      var populate;
      $('#' + id + ' .create').on('click', function() {
        var incd;
        if ($('#m-incident').length > 0) {
          $('#m-incident').remove();
        }
        incd = $(inc);
        $('#' + id + ' .incloc').prepend(incd);
        incd.attr('id', 'm-incident');
        incd.addClass('make');
        $('#' + id + ' .incident_body').html('');
        return requirejs(['models/IncidentModel'], function(Model) {
          var dataModel;
          dataModel = new Model();
          return dataModel.display('m-incident', '/api/create_incident');
        });
      });
      populate = function() {
        return $.each(namespace.incidents, function(key, value) {
          var table;
          table = $('<tr class="click_area">');
          table.append('<td>' + new Date(value.created_at).toLocaleString() + '</td>');
          table.append('<td>' + value.id + '</td>');
          table.append('<td>' + Table.prototype.find_latest(value.incident_datas, 'code') + '</td>');
          table.append('<td>' + Table.prototype.find_latest(value.incident_datas, 'loc') + '</td>');
          table.append('<td>' + Table.prototype.find_latest(value.incident_datas, 'status') + '</td>');
          table.append('<td class="responder"></td>');
          table.append('<td>' + Table.prototype.find_latest(value.incident_datas, 'reporter') + '</td>');
          table.append('<td class="dispatcher"></td>');
          $.getJSON('/api/get_staff?id=' + Table.prototype.find_latest(value.incident_datas, 'responder_id'), function(dat) {
            return table.find('.responder').text(dat.position + ' ' + dat.name);
          });
          $.getJSON('/api/get_staff?id=' + Table.prototype.find_latest(value.incident_datas, 'dispatcher_id'), function(dat) {
            console.log(dat);
            return table.find('.dispatcher').text(dat.position + ' ' + dat.name);
          });
          table.on('click', function() {
            var incd;
            console.log(inc);
            incd = $(inc);
            $('#' + id + ' .incloc').prepend(incd);
            incd.attr('id', 'm-incident');
            $('#' + id + ' .incident_body').html('');
            return requirejs(['models/IncidentModel'], function(Model) {
              var dataModel;
              dataModel = new Model();
              return dataModel.display('m-incident', '/api/get_incident?id=' + value.id);
            });
          });
          return $('#' + id + ' .incident_body').append(table);
        });
      };
      $('#' + id + ' .incident_head').on('click', function() {
        if ($('#m-incident').length > 0) {
          $('#m-incident').remove();
          return populate();
        }
      });
      return populate();
    };

    Table.prototype.find_latest = function(dat, key) {
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

    return Table;

  })();
});
