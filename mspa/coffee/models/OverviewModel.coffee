define ['models/BaseModel', 'views/m-overview'], (BaseModel, OverviewView)->
  class OverviewModel extends BaseModel
    easyRoute: (id)->
      OverviewView.prototype.render(id)

