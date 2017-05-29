ready = ->

  $("body").on "keyup", "#owner_name", ->
    $(this).autocomplete
      source: "/api/searches/find_user"
      focus: (event, ui) ->
        event.preventDefault()
      select: (event, ui) ->
        $("#owner_name").val ui.item.value
        $("#car_user_id").val ui.item.id 


   $(".find-location").click ->
     q = $("#car_spot").val()
     url =  "https://apis.daum.net/local/geo/addr2coord?q=" + q + "&output=json&apikey=3eab053a5c7944b47887390d3c3a5493"
     $.ajax(
       url: "/api/searches/get_latlon"
       type: "get"
       dataType: "json"
       data:
         addr: q
     ).success (json) ->
       if json.length < 1
         alert "Check ADDR"
       else
         $(".latlon-lists span.latlon-list").remove()
         $.each json, (index, data) ->
           str = "<span class='latlon-list'>"
           str += "ADR: " + data.title
           str += ",   LAT: " + data.point_y
           str += ",   LON: " + data.point_x
           str += " <span class='set-latlon tag tag-primary' data-lat='" + data.point_y + "' data-lon='" + data.point_x + "'>SET</span>"
           str += "</span>"
           $(".latlon-lists .col-sm-7").append str
     return false

  $("body").on "click", ".set-latlon", ->
    $("#car_latitude").val $(this).data "lat"
    $("#car_longitude").val $(this).data "lon"




#  $(document).on "submit", "form[method=get]", (e) ->
#    Turbolinks.visit(this.action + (if this.action.indexOf('?') ==  -1 then '?' else '&') + $(this).serialize())
#    return false

#$(document).ready(ready)
$(document).on('turbolinks:load', ready)
