# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  jQuery('#like').on 'click', (event) ->
      form_path = undefined
      link = undefined
      method = undefined
      new_status = undefined
      params = undefined
      new_icon = undefined
      model_id = undefined
      type = undefined
      new_type = undefined
      event.preventDefault()
      link = $(this)
      model_id = link.attr("data-model-id")
      model_class = link.attr("data-model-class")
      method = link.attr("data-status")
      type = ((if method is "like" then "POST" else "DELETE"))
      new_icon = ((if method is "like" then "," else "+"))
      new_status = ((if method is "like" then "unlike" else "like"))
      form_path = "/like/"+model_class+"/id/"+model_id
      params = {}
      $.ajaxSetup
        url: form_path
        type: type
        cache: false
        dataType: "json"
      $.ajax
        complete: ->
          link.attr("data-status", new_status)
          link.attr("alt", new_status)
          link.children('span').attr("data-icon", new_icon)