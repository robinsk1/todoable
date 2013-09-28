$(document).ready ->
  $('#todo-list-partial').delegate '.vote', "click", ->
      form_path = undefined
      link = undefined
      method = undefined
      model_id = undefined
      stuff = undefined
      j = undefined
      event.preventDefault()
      link = $(this)
      model_id = link.attr("data-model-id")
      model_class = link.attr("data-model-class")
      method = link.attr("data-status")
      form_path = ((if method is "up" then "/up/"+model_class+"/id/"+model_id else "/down/"+model_class+"/id/"+model_id))
      $.ajaxSetup
        url: form_path
        type: "POST"
        data: stuff
        cache: false
        dataType: "json"
      $.ajax
        success: (stuff) ->
          if method is "up"
           link.children('span').text(stuff['vote_for'])
           link.children('span').effect("highlight", {}, 3000)
           link.closest('ul').find('.down').children('span').effect("highlight", {}, 3000).text(if method is "up" then stuff['vote_against'] else stuff['vote_for'])
          else
           link.children('span').text(stuff['vote_against'])
           link.children('span').effect("highlight", {}, 3000)
           link.closest('ul').find('.up').children('span').effect("highlight", {}, 3000).text(if method is "up" then stuff['vote_against'] else stuff['vote_for'])

