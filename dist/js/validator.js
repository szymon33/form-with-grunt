(function() {
  var Validator;

  Validator = function() {
    var $msg_layout, clear_msg, make_msg;
    $msg_layout = $("<small class='error'></small>");
    make_msg = function(elem, txt_suffix) {
      var $msg, field_name;
      field_name = $(elem).attr('placeholder');
      $msg = $msg_layout.clone();
      $(elem).addClass('custom-error');
      $($msg).text(field_name + " " + txt_suffix);
      return $(elem).after($msg);
    };
    clear_msg = function(elem) {
      $(elem).removeClass('custom-error');
      return $(elem).next('small.error').remove();
    };
    $('form[validator] input[required], textarea[required]').on('blur', function() {
      var is_already;
      is_already = !($(this).next('small.error').length === 0);
      if (is_already) {
        clear_msg(this);
      }
      if (!($(this).val() && $(this).val() !== '')) {
        return make_msg(this, 'is required');
      }
    });
    $('input[address]').on('blur', function() {
      var address_pattern, is_already;
      is_already = !($(this).next('small.error').length === 0);
      if (!is_already) {
        address_pattern = /[\w,.\s]+[\d]{5}[\w,.\s]*/;
        if ($(this).val() && address_pattern.test($(this).val())) {
          if (is_already) {
            return clear_msg(this);
          }
        } else {
          return make_msg(this, 'is not valid. City, street and postcode (5 digits)');
        }
      }
    });
    return $('input[type=email]').on('blur', function() {
      var email_pattern, is_already;
      is_already = !($(this).next('small.error').length === 0);
      if (!is_already) {
        email_pattern = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i;
        if ($(this).val() && email_pattern.test($(this).val())) {
          if (is_already) {
            return clear_msg(this);
          }
        } else {
          return make_msg(this, 'is not valid');
        }
      }
    });
  };

  jQuery(function() {
    return new Validator();
  });

}).call(this);
