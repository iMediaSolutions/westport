define ['models/BaseModel', 'models/namespace', 'views/incident'], (BaseModel, namespace, Incident)->
  class IncidentModel extends BaseModel
    easyRoute:(id, url, title) ->
      tab = new Incident(id)
      $.getJSON url, (dat)->
        tab.init(id, dat)

