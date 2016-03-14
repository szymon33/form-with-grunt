(function() {
  var dropbox_options;

  dropbox_options = {
    success: function(files) {
      alert("This is just a dropbox simulation. Here's the file link: " + files[0].link);
      return {
        cancel: function() {
          return {};
        },
        linkType: "preview",
        multiselect: false,
        extensions: ['.pdf', '.doc', '.docx']
      };
    }
  };

  jQuery(function() {
    return $('.dropbox-choose').click(function(event) {
      event.preventDefault();
      return Dropbox.choose(dropbox_options);
    });
  });

}).call(this);
