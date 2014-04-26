ready = ->

  $("#toggle-payment-form").click (e) ->
    e.preventDefault()
    $("#search-license-form").hide()
    $("#new_payment_form").toggle()

  $("#submit-payment").click (e) ->
    e.preventDefault()
    $("#search-license-intro").hide()
    $("#search-license-form").hide()
    $("#new_payment_form").hide()
    $("#payment-confirmation").show()

$(document).ready(ready)
$(document).on('page:load', ready)