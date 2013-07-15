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
    type = undefined
    event.preventDefault()
    link = $(this)
    todo_id = $(this).attr("data-todo")
    method = $(this).attr("data-status")
    new_status = ((if method is "open" then "close" else "open"))
    new_icon = ((if method is "open" then "@" else "%"))
    form_path = "/todo/"+todo_id+"/complete"
    type = ((if method is "open" then "DELETE" else "POST"))
    new_type = ((if method is "open" then "POST" else "DELETE"))
    params = {}
    $.ajaxSetup
      url: form_path
      type: type
      cache: false
      dataType: "json"
    $.ajax
      complete: ->
        element = undefined
        link.attr("data-status", new_status)
        link.attr("data-method", new_type)
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


#  jQuery('#like').on 'click', 'a', (event) ->
#        alert("hi")
#        form_path = undefined
#        link = undefined
#        method = undefined
#        new_status = undefined
#        params = undefined
#        new_icon = undefined
#        model_id = undefined
#        type = undefined
#        new_type = undefined
#        event.preventDefault()
#        link = $(this)
#        model_id = link.attr("data-model-id")
#        model_class = link.attr("data-model-class")
#        method = link.attr("data-status")
#        type = ((if method is "like" then "POST" else "DELETE"))
#        new_icon = ((if method is "like" then "," else "+"))
#        new_status = ((if method is "like" then "unlike" else "like"))
#        form_path = "/like/"+model_class+"/id/"+model_id
#        new_type =  ((if method is "like" then "DELETE" else "POST"))
#        params = {}
#        $.ajaxSetup
#          url: form_path
#          type: type
#          cache: false
#          dataType: "json"
#
#        $.ajax
#          complete: ->
#            link.attr("data-status", new_status)
#            link.attr("alt", new_status)
#            link.attr("data-method", new_type)
#            link.children('span').attr("data-icon", new_icon)
#
#
