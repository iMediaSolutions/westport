var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['models/BaseModel', 'models/namespace', 'views/tables'], function(BaseModel, namespace, Table) {
  var TableModel, _ref;
  return TableModel = (function(_super) {
    __extends(TableModel, _super);

    function TableModel() {
      _ref = TableModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    TableModel.prototype.easyRoute = function(id, url, title) {
      var tab;
      tab = new Table(id);
      return $.getJSON(url, function(dat) {
        namespace.incidents = dat;
        return tab.init(id, dat);
      });
    };

    return TableModel;

  })(BaseModel);
});
