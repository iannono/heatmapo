# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("#demo_links li a").click (event)->
    $.ajax
      url:"/heats.json",
      data: {heat: { xpoint: event.pageX, ypoint: event.pageY }},
      type: "POST",
      dataType: "json",
      success: (data) ->
        console.log data
        false
      error: (data) ->
        console.log data
        false


