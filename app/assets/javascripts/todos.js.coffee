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
      dataType: "script"
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
          total = $(".opened").length +  $(".closed").length
          perc = ($(".closed").length / total) * 100
          $('.percentage').html(Math.round(perc) + "% done");
          $('.percentage').effect("highlight", {}, 3000);
        else
          element = link.closest(".opened")
          element.removeClass("opened").addClass "closed"
          element.remove()
          $(".closed-container").append element
          total = $(".opened").length +  $(".closed").length
          perc = ($(".closed").length / total) * 100
          $('.percentage').html(Math.round(perc) + "% done");
          $('.percentage').effect("highlight", {}, 3000);

  $("input").keypress (event) ->
    if event.which is 13
      event.preventDefault()
      $("form").submit()


