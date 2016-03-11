# Foundation JavaScript
# Documentation can be found at: http://foundation.zurb.com/docs
$(document).foundation()

# menu parallax
jQuery ->
  $(document).on "scroll", ->
    if $(@).scrollTop() > 100
      $(".top-bar").removeClass("large").addClass("small")
    else
      $(".top-bar").removeClass("small").addClass("large")

# thank you for apply modal
jQuery ->
  $('#apply').click (event) ->
    $('form[validator]').find('input, textarea').each (index, value) ->
      $(value).trigger('blur')

    errors = $("form[validator]").find(".custom-error")
    if errors.length == 0
      # this is just a simmulation. Message could be called from callback
      txt = "Thank you for your application " + $("input[name=firstname]").val() + "!"
      $('#thankYouModal').find('p.lead').text(txt)
      $('#thankYouModal').foundation('reveal', 'open')
    else
      errors[0].focus()

    event.preventDefault()