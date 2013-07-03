# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.best_in_place').best_in_place()


$(document).ready ->
  $("#project_tag_list").tagit()
  $("#project_tag_list").tagit fieldName: "[project]tag_list"
  $("#project_tag_list").tagit availableTags: ["art", "music", "food"]

  jQuery('#participation').on 'click', (event) ->
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
      regex = (new RegExp(/^\/lists\/(.*)\/(.*)$/)).exec(path)
      project_id = regex[1]
      method = link.html()
      new_status = ((if method is "join" then "leave" else "join"))
      form_path = "/lists/"+project_id+"/"+method
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
          stuff = "/lists/"+project_id+"/"+new_status
          link.attr('href', stuff)
          if method is "join"
  #          element = link.closest(".closed")
  #          element.removeClass("closed").addClass "opened"
  #          element.removeClass("alert").addClass "success"
  #          element.remove()
  #          $(".opened-container").append element
          else
  #          element = link.closest(".opened")
  #          element.removeClass("opened").addClass "closed"
  #          element.removeClass("success").addClass "alert"
  #          element.remove()
  #          $(".closed-container").append element

        beforeSend: ->


#  stuff = '#best_in_place_project_'+project_id+'_tag_list'
# $(stuff).tagit()

