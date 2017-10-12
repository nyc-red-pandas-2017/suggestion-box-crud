Root Route Providing Current User information for the partial.  Is this the proper placement of this information, it did not feel right in the view.

In "/app/controllers/suggestion"  Why does route order dependency mater in these catching?


In Suggerstion migration file, is the validations on t.reference redundent?


In User model was able to validate a min. password length but was unable to figure out how, if we have to, do so in the user migration file



Need Help implimenting the up_vote functionalitly.  I believe the forms work but have been unable to test them for I could not get the conditional display to work properly found in "/views/up_votes/_up_date"


ActiveRecord associations unquie (object is an array and could use that later), but is there a way code in that type of parameter (ex. Currenetly suppoerters from the User model will produce duplicates)

HTML Syntax, Current User conditonal logic within or outside of the <div></div>? See "/views/index"

As of Day 2 Code Review Push: Working on upvote button and its conditional employment.
<!--     <% if own_suggestion?(suggestion, current_user) %>
      <a href="/suggestions/<%= suggestion.id %>/edit">Edit</a>
      <%= erb :"suggestions/_delete", layout: false, locals: {suggestion: suggestion} %>
    <% end %>
    <% if already_up_voted?(suggestion, current_user) %>
      <%= erb :"up_votes/_delete", layout: false, locals: {suggestion: suggestion} %>
    <% else %>
      <%= erb :"up_votes/_up_vote_form", layout: false, locals: {suggestion: suggestion} %>
    <% end %> -->

