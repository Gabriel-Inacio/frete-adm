$(window).load(function() {
  $('.filter_form').on('click', '.clear_filters_btn', function(event) {
    event.preventDefault();
    var localtion = window.location;
    window.location.replace(location.origin + location.pathname + '?clear_filters=true');
  });
});