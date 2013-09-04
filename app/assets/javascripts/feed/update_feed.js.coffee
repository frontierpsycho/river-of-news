$ ->
  setInterval( ->
    $.get 'fetch_latest', (data) ->
      $('div.feed').prepend(data.trim()).masonry( 'reloadItems' )
      $('div.feed').masonry()
  , 5000)
