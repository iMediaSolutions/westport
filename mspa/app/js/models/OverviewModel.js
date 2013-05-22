var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/BaseModel', 'views/m-overview'], function(BaseModel, OverviewView) {
  var OverviewModel, _ref;

  return OverviewModel = (function(_super) {
    __extends(OverviewModel, _super);

    function OverviewModel() {
      _ref = OverviewModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    OverviewModel.prototype.easyRoute = function(id) {
      return OverviewView.prototype.render(id);
    };

    return OverviewModel;

  })(BaseModel);
});
