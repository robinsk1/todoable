
jQuery ($) ->
  input = document.getElementById("project_location_attributes_city")
  options =
    types: ["(cities)"]
#    componentRestrictions:
#      country: "fr"

  autocomplete = new google.maps.places.Autocomplete(input, options)