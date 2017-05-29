ready = ->

  $("body").on "keyup", "#owner_name", ->
    $(this).autocomplete
      source: "/api/searches/find_user"
      focus: (event, ui) ->
        event.preventDefault()
      select: (event, ui) ->
        $("#owner_name").val ui.item.value
        $("#car_user_id").val ui.item.id 



#$(document).ready(ready)
$(document).on('turbolinks:load', ready)
