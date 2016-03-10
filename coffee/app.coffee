# Foundation JavaScript
# Documentation can be found at: http://foundation.zurb.com/docs
$(document).foundation()

# menu parallax
 ->
  $(document).on "scroll", ->
    if $(document).scrollTop() > 100
      $(".top-bar").removeClass("large").addClass("small")
    else
      $(".top-bar").removeClass("small").addClass("large")
