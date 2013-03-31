var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/BaseModel', 'views/m-tabs'], function(BaseModel, TabView) {
  var TabsModel, _ref;

  return TabsModel = (function(_super) {
    __extends(TabsModel, _super);

    function TabsModel() {
      _ref = TabsModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    TabsModel.prototype.easyRoute = function(id, url) {
      console.log(url);
      return $.getJSON(url, function(data) {
        return TabView.prototype.render(id, data);
      });
    };

    return TabsModel;

  })(BaseModel);
});
