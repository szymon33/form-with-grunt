(function() {
  jQuery(function() {
    return $('form input required').onblur(function() {
      return alert('input required');
    });
  });

}).call(this);
