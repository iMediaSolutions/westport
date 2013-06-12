define ['models/BaseModel', 'models/namespace', 'views/tables'], (BaseModel, namespace, Table)->
  class TableModel extends BaseModel
    easyRoute:(id, url, title) ->
      tab = new Table(id)
      $.getJSON url, (dat)->
        namespace.incidents = dat
        tab.init(id, dat)

