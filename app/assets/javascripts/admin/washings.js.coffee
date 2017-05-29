ready = ->


  moment.locale('ko')
  dayEle = document.getElementById("washing_wash_date")
  sTimeEle = document.getElementById("washing_start_time")
  eTimeEle = document.getElementById("washing_end_time")

  dayDialog = new mdDateTimePicker.default(
    type: 'date',
    future: moment().add(4, 'months'),
    trigger: dayEle
  )



  sTimeDialog = new mdDateTimePicker.default(
    type: 'time',
    trigger: sTimeEle
  )


  eTimeDialog = new mdDateTimePicker.default(
    type: 'time',
    trigger: eTimeEle
  )



  if dayEle != null
    dayEle.addEventListener "click", ->
      dayDialog.toggle()
    dayEle.addEventListener "onOk", (e) ->
      this.value = dayDialog.time.format('YYYY-MM-DD')

  if eTimeEle != null
    eTimeEle.addEventListener "click", ->
      eTimeDialog.toggle()
    eTimeEle.addEventListener "onOk", (e) ->
      this.value = eTimeDialog.time.format('HH:mm')

  if sTimeEle != null
    sTimeEle.addEventListener "click", ->
      sTimeDialog.toggle()
    sTimeEle.addEventListener "onOk", (e) ->
      this.value = sTimeDialog.time.format('HH:mm')


  $("body").on "keyup", "#customer_name", ->
    $(this).autocomplete
      source: "/api/searches/find_user"
      focus: (event, ui) ->
        event.preventDefault()
      select: (event, ui) ->
        $("#customer_name").val ui.item.value
        $("#washing_user_id").val ui.item.id 

  $("body").on "keyup", "#car_number", ->
    $(this).autocomplete
      source: "/api/searches/find_user_cars?user_id=" + $("#washing_user_id").val()
      data:
        user_id: $("#washing_user_id").val()
      focus: (event, ui) ->
        event.preventDefault()
      select: (event, ui) ->
        $("#car_name").val ui.item.value
        $("#washing_car_id").val ui.item.id

  $("body").on "keyup", "#washer_name", ->
    $(this).autocomplete
      source: "/api/searches/find_user"
      focus: (event, ui) ->
        event.preventDefault()
      select: (event, ui) ->
        $("#washer_name").val ui.item.value
        $("#washing_washer_id").val ui.item.id 






#$(document).ready(ready)
$(document).on('turbolinks:load', ready)
