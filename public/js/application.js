$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  $("#upvote").on("submit", function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method')
    })
      .done(function(response) {
        $(".votes").text(response);
      })
  })
  $("#downvote").on("submit", function(event) {
    event.preventDefault();
    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method')
    })
      .done(function(response) {
        $(".votes").text(response);
      })
  })
});
