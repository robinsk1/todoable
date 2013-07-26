$(document).ready ->
  $container = $("#todo-elements-container")
  $container.isotope
    masonry:
     columnWidth: $container.width() / 4
    itemSelector : ".todo-element"
    filter: "*"
    animationOptions:
      duration: 750
      easing: "linear"
      queue: false

