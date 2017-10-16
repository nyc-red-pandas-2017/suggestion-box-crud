$(document).ready(function() {
  $("#upvote").on("submit", function(event){
    event.preventDefault();
    var myUrl = $(this).attr('action'),
        myMethod = $(this).attr('method');
    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize()
    }).done(function(response){
      $('#thumbs-up').html(response)
    })
  })
});
