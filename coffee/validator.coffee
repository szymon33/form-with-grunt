Validator = ->
  $msg_layout = $("<small class='error'></small>")

  make_msg = (elem, txt_suffix) ->
    field_name = $(elem).attr('placeholder')
    $msg = $msg_layout.clone()
    $(elem).addClass('custom-error')
    $($msg).text(field_name + " " + txt_suffix)
    $(elem).after($msg)

  clear_msg = (elem) ->
    $(elem).removeClass('custom-error')    
    $(elem).next('small.error').remove()

  # required has priority
  $('form[validator] input[required], textarea[required]').on 'blur',  ->
    is_already = not ($(@).next('small.error').length == 0)
    clear_msg(@) if is_already    
    unless ($(@).val() && $(@).val() != '')
      make_msg(@, 'is required')

  # address pattern
  $('input[address]').on 'blur', ->
    is_already = not ($(@).next('small.error').length == 0)
    if not is_already
      address_pattern = /[\w,.\s]+[\d]{5}[\w,.\s]*/
      if $(@).val() && address_pattern.test($(@).val())
        clear_msg(@) if is_already
      else
        make_msg(@, 'is not valid. City, street and postcode (5 digits)')

  # e-mail pattern
  $('input[type=email]').on 'blur', ->
    is_already = not ($(@).next('small.error').length == 0)
    if not is_already
      email_pattern = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
      if $(@).val() && email_pattern.test($(@).val())
        clear_msg(@) if is_already
      else
        make_msg(@, 'is not valid')

jQuery ->
  new Validator()
