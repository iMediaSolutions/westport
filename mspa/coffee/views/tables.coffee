define ['text!/templates/incident.html', 'models/namespace'], (inc, namespace)->
	class Table
		constructor: (@id) ->
		init: (id, dat) ->
			$('#' + id + ' .create').on 'click', ()->
				if $('#m-incident').length>0
					$('#m-incident').remove()
				incd = $(inc)
				$('#' + id + ' .incloc').prepend(incd)
				incd.attr('id', 'm-incident')
				$('#' + id + ' .incident_body').html('')
				requirejs ['models/IncidentModel'], (Model) -> 
					dataModel = new Model()
					dataModel.display('m-incident', '/api/create_incident')
			populate = ()->
				$.each namespace.incidents, (key, value) ->
					table = $('<tr class="click_area">')
					table.append('<td>' + new Date(value.created_at).toLocaleString() + '</td>')
					table.append('<td>' + value.id + '</td>')
					table.append('<td>' + Table.prototype.find_latest(value.incident_datas, 'code') + '</td>')
					table.append('<td>' + Table.prototype.find_latest(value.incident_datas, 'loc') + '</td>')
					table.append('<td>' + Table.prototype.find_latest(value.incident_datas, 'status') + '</td>')
					table.append('<td class="responder"></td>')
					table.append('<td>' + Table.prototype.find_latest(value.incident_datas, 'reporter') + '</td>')
					table.append('<td class="dispatcher"></td>')
					$.getJSON '/api/get_staff?id=' + Table.prototype.find_latest(value.incident_datas, 'responder_id'), (dat)->
						table.find('.responder').text(dat.position + ' ' + dat.name)
					$.getJSON '/api/get_staff?id=' + Table.prototype.find_latest(value.incident_datas, 'dispatcher_id'), (dat)->
						console.log dat
						table.find('.dispatcher').text(dat.position + ' ' + dat.name)
					table.on 'click', ()->
						console.log inc
						incd = $(inc)
						$('#' + id + ' .incloc').prepend(incd)
						incd.attr('id', 'm-incident')
						$('#' + id + ' .incident_body').html('')
						requirejs ['models/IncidentModel'], (Model) -> 
							dataModel = new Model()
							dataModel.display('m-incident', '/api/get_incident?id=' + value.id)
					$('#' + id + ' .incident_body').append(table)
			$('#' + id + ' .incident_head').on 'click', ()->
				if $('#m-incident').length>0
					$('#m-incident').remove()
					populate()
			populate()
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
