(function() {
  $(document).foundation();

  jQuery(function() {
    return $(document).on("scroll", function() {
      if ($(this).scrollTop() > 100) {
        return $(".top-bar").removeClass("large").addClass("small");
      } else {
        return $(".top-bar").removeClass("small").addClass("large");
      }
    });
  });

  jQuery(function() {
    return $('#apply').click(function(event) {
      var errors, txt;
      $('form[validator]').find('input, textarea').each(function(index, value) {
        return $(value).trigger('blur');
      });
      errors = $("form[validator]").find(".custom-error");
      if (errors.length === 0) {
        txt = "Thank you for your application " + $("input[name=firstname]").val() + "!";
        $('#thankYouModal').find('p.lead').text(txt);
        $('#thankYouModal').foundation('reveal', 'open');
      } else {
        errors[0].focus();
      }
      return event.preventDefault();
    });
  });

  jQuery(function() {
    return $("#back-to-top").click(function(event) {
      event.preventDefault();
      return $('body,html').animate({
        scrollTop: 0
      }, 1000);
    });
  });

}).call(this);
