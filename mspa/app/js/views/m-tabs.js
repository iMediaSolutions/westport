define([], function() {
  var TabView;

  return TabView = (function() {
    function TabView() {}

    TabView.prototype.render = function(id, data) {
      var firstTime, list, tab, _i, _len;

      console.log('in here');
      list = '';
      firstTime = true;
      for (_i = 0, _len = data.length; _i < _len; _i++) {
        tab = data[_i];
        console.log('tab');
        console.log(tab);
        list = list + '<li ';
        if (firstTime) {
          list = list + 'class="active"';
          firstTime = false;
          $(tab.href).addClass('active');
        }
        list = list + '><a data-toggle="tab" href="' + tab.href + '">' + tab.title + "</a></li>";
      }
      return $('#' + id).html(list);
    };

    return TabView;

  })();
});
