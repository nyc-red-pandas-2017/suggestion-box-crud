User.create(username: "cat", password: "cat")
User.create(username: "tony", password: "tony1")
User.create(username: "pan", password: "pan1")

Suggestion.create(title: "Suggestion 1", description: "suggestion", user_id: 1)
Suggestion.create(title: "Suggestion 2", description: "suggestion", user_id: 2)
Suggestion.create(title: "Suggestion 3", description: "suggestion", user_id: 3)

Comment.create(text: "test comment", suggestion_id: 1, user_id: 1)
Comment.create(text: "test comment 2", suggestion_id: 2, user_id: 2)
Comment.create(text: "test comment 3", suggestion_id: 3, user_id: 3)
