# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ($) ->
  jQuery(document.body).on 'click', '.toggle a', (event) ->
    form_path = undefined
    link = undefined
    method = undefined
    new_status = undefined
    params = undefined
    path = undefined
    regex = undefined
    todo_id = undefined
    event.preventDefault()
    path = $(this)[0].pathname
    link = $(this)
    regex = (new RegExp(/^\/todos\/(.*)\/toggle$/)).exec(path)
    todo_id = regex[1]
    method = link.html()
    new_status = ((if method is "open" then "close" else "open"))
    form_path = "/todos/" + todo_id + "/toggle"
    params = {}
    $.ajaxSetup
      url: form_path
      type: "PUT"
      cache: false
      dataType: "json"

    $.ajax
      complete: ->
        element = undefined
        link.html new_status
        if method is "open"
          element = link.closest(".closed")
          element.removeClass("closed").addClass "opened"
#          element.removeClass("alert").addClass "success"
          element.remove()
          $(".opened-container").append element
        else
          element = link.closest(".opened")
          element.removeClass("opened").addClass "closed"
#          element.removeClass("success").addClass "alert"
          element.remove()
          $(".closed-container").append element

      beforeSend: ->


