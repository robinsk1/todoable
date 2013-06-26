jQuery ($) ->
  input = document.getElementById("project_location_search")
  options =
    types: ["(cities)"]
#    componentRestrictions:
#      country: "fr"

  autocomplete = new google.maps.places.Autocomplete(input, options)