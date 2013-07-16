// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require jquery.purr
//= require best_in_place
//= require jquery.stellar
//= require foundation
//= require custom.modernizr
//= require social-share-button
//= require_tree .

$(document).ready(function(){

$(document).foundation();

$('#upload-image').on('change', function (evt){
    var files = evt.target.files;
    var f = files[0];
    var reader = new FileReader();
      reader.onload = (function(theFile) {
        return function(e) {
          $('#image-preview').html(['<div class="project-image" style="background:url(', e.target.result,') no-repeat left center transparent;"></div>' ].join(''));
        };
      })(f);
      reader.readAsDataURL(f);
  });
})
