$(document).ready ->
  jQuery('#participation').on 'click', (event) ->
        form_path = undefined
        link = undefined
        method = undefined
        new_status = undefined
        params = undefined
        new_icon = undefined
        project_id = undefined
        type=undefined
        new_type=undefined

        event.preventDefault()

        link = $(this)

        project_id = link.attr("data-project")
        method = link.attr("data-status")
        new_status = ((if method is "join" then "leave" else "join"))
        new_icon = ((if method is "join" then "O" else "N"))
        form_path = "/lists/"+project_id+"/join.js"
        type = ((if method is "join" then "POST" else "DELETE"))

        $.ajaxSetup
          url: form_path
          type: type
          cache: false
          dataType: 'script'

        $.ajax
          complete: (data)->
            link.attr("data-status", new_status)
            link.children('span').attr("data-icon", new_icon)
#            $('#todo-list-partial').effect("highlight", {}, 3000);
            eval(data)





