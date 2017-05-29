ready = ->

  $('#car-list-modal').on 'show.bs.modal',  (event) ->
    $("#car-list-modal .modal-body").html "<div class='modal-center'><img src='/awash_images/loading.gif' alt='loading'/><p>Loading.....</p></div>"
    button = $(event.relatedTarget)
    user_id = button.data('user-id')
    $.ajax(
      url: "/api/searches/get_user_cars?user_id=" + user_id
      type: "get"
      dataType: "json"
    ).success (json) ->
      modal = $(this)
      str = ""
      if json.length > 0
        for data in json
          str += "<p>"
          str += data.name + ", " 
          str += "<span id='spot" + data.id + "' value='" + data.spot + "'>" +  data.spot +  "</span>"
          str += "<span class='tag tag-primary copy-target' data-clipboard-target='#spot" + data.id + "'>Copy</span>"
          if data.lat != null && data.lon != null
            str += "<a class='tag tag-primary' target='_blank' href='http://map.daum.net/link/to/김혜연 차," + data.lat + "," + data.lon + "'>찾기</a>"
            str += "<a class='tag tag-primary' target='_blank' href='daummaps://route?sp=&ep=" + data.lat + "," + data.lon + "&by=CAR'>Mobile 찾기</a>"
          str += "</p>"
        $("#car-list-modal .modal-body").html str
        clip = new Clipboard('body .copy-target')

        toastr.options =
          "positionClass": "toast-bottom-center"

        $("body .copy-target").click ->
          toastr.info "주소 복사 완료"
      else
        $("#car-list-modal .modal-body").html "<div class='modal-center'><img src='/awash_images/ghost.gif' width='200' alt='loading'/><p>No Data.....</p></div>"

  clip = new Clipboard('body .copy-target')

  toastr.options =
    "positionClass": "toast-bottom-center"

  $("body .copy-target").click ->
    toastr.info "주소 복사 완료"


#$(document).ready(ready)
$(document).on('turbolinks:load', ready)
