$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#new-btn").on("click", function(event) {
    event.preventDefault()

    var $suggestion_button = $(event.target);

    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method')
  })

    .done(function(response) {
      console.log(response)
      $suggestion_button.hide();
      $("#sug-btn-div").append(response)
      $suggestion_button.show();
    })


// $("#suggestion-form").on("submit", function(event) {
//     event.preventDefault()

//     $.ajax({
//       url: $(this).attr('action'),
//       method: $(this).attr('method'),
//       data: $(this).serialize()

//     })
//     .done(function(response) {

//     })
  })
});
