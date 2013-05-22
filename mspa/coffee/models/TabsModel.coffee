define ['models/BaseModel', 'views/m-tabs'], (BaseModel, TabView)->
  class TabsModel extends BaseModel
    easyRoute: (id, url)->
      console.log url
      $.getJSON url, (data) ->
        TabView.prototype.render(id, data)

