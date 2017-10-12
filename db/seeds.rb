b -UpVote.delete_all
Suggestion.delete_all
User.delete_all

penn = User.create!(username: "penn", password: "123456")
thomas = User.create!(username: "thomas", password: "123456")
david = User.create!(username: "david", password: "123456")
andres = User.create!(username: "andres", password: "123456")
chris = User.create!(username: "chris", password: "123456")
amber = User.create!(username: "amber", password: "123456")

s1 = Suggestion.create!(title: "Get Sleep", body: "It is not a government conspiracy!", user: thomas)
s2 = Suggestion.create!(title: "Eat Dumplings", body: "The are afforable and delicous!", user: thomas)
s3 = Suggestion.create!(title: "Get Revenge", body: "Enough Said (JK: We can all be friends)", user: penn)

UpVote.create!(user: thomas, suggestion: s3)
UpVote.create!(user: david, suggestion: s3)
UpVote.create!(user: andres, suggestion: s3)
UpVote.create!(user: chris, suggestion: s3)
UpVote.create!(user: amber, suggestion: s3)
UpVote.create!(user: andres, suggestion: s1)
UpVote.create!(user: andres, suggestion: s2)
UpVote.create!(user: david, suggestion: s1)
UpVote.create!(user: david, suggestion: s2)

# Should Have on other End
#Penn Up_Voted 5 times, 0 up_votes
#Thomas Up_Voted 4 times, 1 up_votes
#David Up_Voted 0 times, 3 up_votes
