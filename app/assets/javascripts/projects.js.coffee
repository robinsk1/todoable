jQuery ->
  $('.best_in_place').best_in_place()
  $(window).stellar()

$(document).ready ->
  $("#project_tag_list").tagit
  $("#project_tag_list").tagit placeholderText: "Add some tags"
  $("#project_tag_list").tagit fieldName: "[project]tag_list"
  $("#project_tag_list").tagit availableTags: ["art", "music", "food"]

#  jQuery('#participation').on 'click', (event) ->
#      form_path = undefined
#      link = undefined
#      method = undefined
#      new_status = undefined
#      params = undefined
#      new_icon = undefined
#      project_id = undefined
#      event.preventDefault()
#      link = $(this)
#      project_id = link.attr("data-project")
#      method = link.attr("data-status")
#      new_status = ((if method is "join" then "leave" else "join"))
#      new_icon = ((if method is "join" then "O" else "N"))
#      form_path = "/lists/"+project_id+"/"+method
#      $.ajaxSetup
#        url: form_path
#        type: "PUT"
#        cache: false
#        dataType: "json"
#
#      $.ajax
#        complete: ->
#          link.attr("href", "/lists/"+project_id+"/"+new_status )
#          link.attr("data-status", new_status)
#          link.children('span').attr("data-icon", new_icon)


