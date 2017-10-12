$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("#signup-form").hide();
  $("#login-form").hide();
  //$(".delete-suggestion").hide();
  //$("#create-new-tweet").hide();

  $("#new-user-choice").on("submit", function(event) {
    event.preventDefault();
    $("#login-form").hide();
    $("#signup-form").show();
    });

  $("#login-user-choice").on("submit", function(event) {
    event.preventDefault();
    $("#signup-form").hide();
    $("#login-form").show();
    });

  $("a[href = '#delete']").on("click", function(event) {
    event.preventDefault();
    $(this).parent().find('.delete-suggestion').show();
    });

  $("a[href = '#edit']").on("click", function(event) {
    event.preventDefault();
    $(this).parent().find('.edit-suggestion').show();
    });

  $("a[href = '#hide-delete']").on("click", function(event) {
    event.preventDefault();
    $(this).parent().parent().parent().hide();
    });

});
