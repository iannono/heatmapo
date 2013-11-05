# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(".progress").hide()
  $(".alert").hide()

  $("td.generate a").click ->
    that = this
    $.ajax
      type: "get"
      dataType: "json"
      url: $(this).attr("href")
      beforeSend: ->
        $(that).text("generating......").addClass("pure-button-disabled")
        $(".progress").fadeIn()
      success: ->
      complete: ->
        $(".progress").fadeOut()
        $(".alert").text("Successfully generate the site img")
                    .addClass("alert-success").fadeIn().fadeOut(5000)
        $(that).text("generate img").removeClass("pure-button-disabled")
      error: ->
    false
