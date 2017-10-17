// $(document).ready(function() {
//   upvote();
//   downvote();
// });


// var thumbs_up = function(){
//   $("div.vote-container").on('submit', '.thumbs_up', function(e){
//     e.preventDefault()
//     addthumbs_up(this)
//   })
// };

// var thumbs_down = function(){
//   $("div.vote-container").on('submit', '.thumbs_down', function(e){
//     e.preventDefault()
//     addthumbs_down(this)
//   });
// };



// var addthumbs_up = function(a){
//   $.ajax({
//     url: $(event.target).attr("action");
//     method: 'post'
//   })

//   .done(function(msg){
//       $("#suggestion-" + msg.id + "p.thumbs_up").text(msg.content)
//   })
// };

// var addthumbs_down = function(a){
//   $.ajax({
//   url: $(event.target).attr("action");
//   method: "post"
//   })

//   .done(function(msg){
//       $("#suggestion-" + msg.id + "p.thumbs_up").text(msg.content)
//   })
// };



