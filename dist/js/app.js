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

}).call(this);
