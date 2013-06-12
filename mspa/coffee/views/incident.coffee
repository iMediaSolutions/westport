define ['models/namespace'], (namespace)->
	class Incident 
		constructor: (@id) ->
		init: (id, dat) ->
			$('#' + id + ' .inc').text(dat.id)
			$('#' + id + ' .code').attr('value',Incident.prototype.find_latest(dat.incident_datas, 'code')).blur ()->
				$.getJSON '/api/update_incident?id=' + dat.id + '&code=' + $(this).val(), (dat) ->
        	$.getJSON '/api/get_incident.json', (dat) ->
        			namespace.incidents = dat
			$('#' + id + ' .loc').attr('value',Incident.prototype.find_latest(dat.incident_datas, 'loc')).blur ()->
				showAddress $(this).val()
				$.getJSON '/api/update_incident?id=' + dat.id + '&loc=' + $(this).val(), (dat) ->
        	$.getJSON '/api/get_incident.json', (dat) ->
        			namespace.incidents = dat
			$('#' + id + ' .status').attr('value',Incident.prototype.find_latest(dat.incident_datas, 'status')).blur ()->
				$.getJSON '/api/update_incident?id=' + dat.id + '&status=' + $(this).val(), (dat) ->
        	$.getJSON '/api/get_incident.json', (dat) ->
        			namespace.incidents = dat
			$('#' + id + ' .date').text(new Date(dat.created_at).toLocaleString())
			$('#' + id + ' .description').append(Incident.prototype.find_latest(dat.incident_datas, 'desc')).blur () ->
				$.getJSON '/api/update_incident?id=' + dat.id + '&desc=' + $(this).val(), (dat) ->
        	$.getJSON '/api/get_incident.json', (dat) ->
        			namespace.incidents = dat
			$('#' + id + ' .reporter').attr('value', Incident.prototype.find_latest(dat.incident_datas, 'reporter')).blur () ->
				$.getJSON '/api/update_incident?id=' + dat.id + '&reporter=' + $(this).val(), (dat) ->
        	$.getJSON '/api/get_incident.json', (dat) ->
        			namespace.incidents = dat
			$.getJSON '/api/get_staff', (val)->
				$.each val, (key, vals) ->
					$('#' + id + ' .responder').append('<option value="' + vals.id + '">' + vals.position + ' ' + vals.name + '</option>')
					$('#' + id + ' .dispatcher').append('<option value="' + vals.id + '">' + vals.position + ' ' + vals.name + '</option>')
				$('#' + id + ' .responder').val(Incident.prototype.find_latest(dat.incident_datas, 'responder_id')).blur () ->
					$.getJSON '/api/update_incident?id=' + dat.id + '&responder_id=' + $(this).val(), (dat2) ->
        		$.getJSON '/api/get_incident.json', (dat3) ->
        			namespace.incidents = dat3
				$('#' + id + ' .dispatcher').val(Incident.prototype.find_latest(dat.incident_datas, 'dispatcher_id')).blur () ->
					$.getJSON '/api/update_incident?id=' + dat.id + '&dispatcher_id=' + $(this).val(), (dat2) ->
        		$.getJSON '/api/get_incident.json', (dat3) ->
        			console.log dat
        			namespace.incidents = dat3
			inits = () ->
				mapOptions = {
					zoom: 8
					center: new google.maps.LatLng(-34.397, 150.644)
					mapTypeId: google.maps.MapTypeId.ROADMAP
				}
				@map = new google.maps.Map($('#' + id + ' .map')[0], mapOptions)
			inits()
			geocoder = new google.maps.Geocoder()
			showAddress = (add)->
				geocoder.geocode {address: add }, (res, stat)->
					if stat == google.maps.GeocoderStatus.OK
						@map.setCenter res[0].geometry.location
						@map.setZoom 15
						loc = res[0].geometry.location
						marker = new google.maps.Marker
							map: @map
							animation: google.maps.Animation.DROP
							position: loc
							title: "Incident: " + dat.id
					else
						console.log stat
			showAddress(Incident.prototype.find_latest(dat.incident_datas, 'loc'))
		find_latest: (dat, key) ->
			found = []
			$.each dat, (ky, value) ->
				if(value.incident_type.name == key)
					found.push(value)
			latest = found[0]
			$.each found, (ky, value) ->
				if(new Date(latest.created_at).getTime() < new Date(value.created_at).getTime())
					latest = value
			if latest == undefined || latest.value == undefined
				latest = {}
				latest.value = ''
			latest.value
