jQuery ->
  $('.best_in_place').best_in_place()
  $(window).stellar()

$(document).ready ->
  $("#project_tag_list").tagit
  $("#project_tag_list").tagit placeholderText: "Add some tags"
  $("#project_tag_list").tagit fieldName: "[project]tag_list"
  $("#project_tag_list").tagit availableTags: ["art", "music", "food"]

