# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#jQuery ($) ->
#  $("#submit-modal-topics").click (e) ->
#    e.preventDefault()
#    tags = new Array()
#    $("#modal-buttons a[class=\"button small_ mb5\"]").each ->
#      tag = $(this).attr("data")
#      tags.push tag
#      tagString = tags.join(", ")
#      $(".placeholder").html tagString
#      $("#hidden-tag-list").attr "value", tagString


#jQuery("#tags").on 'click', 'a', (e) ->
#      e.preventDefault()
##        path = $(this).attr("data")
##        alert(path);
#      tags = new Array()
#      $("#tags a[class=\"button tiny tag\"]").each ->
#        tag = $(this).attr("data")
#        tags.push tag
#        tagString = tags.join(", ")
#        alert(tagString)
##          $(".placeholder").html tagString
#        $("#project_tag_list").attr "value", tagString

$(document).ready ->
  $("#project_tag_list").tagit()
  $("#project_tag_list").tagit fieldName: "[project]tag_list"
  $("#project_tag_list").tagit availableTags: ["art", "music", "food"]

