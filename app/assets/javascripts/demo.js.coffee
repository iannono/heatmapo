# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $("#demo_links li a").click (event)->
    $.ajax
      url:"/sites/8/heats",
      data: {heat: { xpoint: event.pageX, ypoint: event.pageY, screen_ratio: "1440*900" }},
      type: "POST",
      dataType: "json",
      success: (data) ->
        console.log data
        false
      error: (data) ->
        console.log data
        false
