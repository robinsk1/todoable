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
    method = $(this).attr("data-status")
    new_status = ((if method is "open" then "close" else "open"))
    new_icon = ((if method is "open" then "@" else "%"))
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
        link.attr("data-status", new_status)
        link.children('span').attr("data-icon", new_icon)
        if method is "open"
          element = link.closest(".closed")
          element.removeClass("closed").addClass "opened"
          element.remove()
          $(".opened-container").append element
        else
          element = link.closest(".opened")
          element.removeClass("opened").addClass "closed"
          element.remove()
          $(".closed-container").append element
      beforeSend: ->

  $("input").keypress (event) ->
    if event.which is 13
      event.preventDefault()
      $("form").submit()


