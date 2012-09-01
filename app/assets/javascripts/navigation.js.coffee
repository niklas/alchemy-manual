$ ->
  $('#sidebar-button').on 'click', (e) ->
    e.preventDefault()
    $('#navigation dl').toggleClass('hide-for-small')
    return false
