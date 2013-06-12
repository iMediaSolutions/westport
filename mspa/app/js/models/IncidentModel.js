var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/BaseModel', 'models/namespace', 'views/incident'], function(BaseModel, namespace, Incident) {
  var IncidentModel, _ref;
  return IncidentModel = (function(_super) {
    __extends(IncidentModel, _super);

    function IncidentModel() {
      _ref = IncidentModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    IncidentModel.prototype.easyRoute = function(id, url, title) {
      var tab;
      tab = new Incident(id);
      return $.getJSON(url, function(dat) {
        return tab.init(id, dat);
      });
    };

    return IncidentModel;

  })(BaseModel);
});
