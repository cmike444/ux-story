window.App ||= {}

App.init = ->
  jQuery -> 
    $('form').on 'click', '.remove_user', (event) ->
      $(this).prev('input[type=hidden]').val('1')
      $(this).closest('.input-group').hide().remove()
      event.preventDefault()

    $('form').on 'click', '#add-collaborator', (event) ->
      $('.users-list').find('.input-group:first-child').clone().find('input').val('').end().prependTo('.users-list')
      event.preventDefault()

$(document).on "page:change", ->
  App.init()