define [], () ->
  class TabView
    render: (id, data) ->
      console.log 'in here'
      list = ''
      firstTime = true
      for tab in data
        console.log 'tab'
        console.log tab
        list = list + '<li '
        if firstTime
          list = list + 'class="active"'
          firstTime = false
          $(tab.href).addClass('active')
        list = list + '><a data-toggle="tab" href="' + tab.href + '">' + tab.title + "</a></li>"
      $('#' + id).html(list)
