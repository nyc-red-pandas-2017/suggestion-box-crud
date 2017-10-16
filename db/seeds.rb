Suggestion.delete_all
User.delete_all
penn = User.create!(username: "penn", password: "123456")
thomas = User.create!(username: "thomas", password: "123456")
david = User.create!(username: "david", password: "123456")
andres = User.create!(username: "andres", password: "123456")
chris = User.create!(username: "chris", password: "123456")
amber = User.create!(username: "amber", password: "123456")
s1 = Suggestion.create!(title: "Get Sleep", description: "It is not a government conspiracy!", user: thomas)
s2 = Suggestion.create!(title: "Eat Dumplings", description: "The are afforable and delicous!", user: thomas)
s3 = Suggestion.create!(title: "Get Revenge", description: "Enough Said (JK: We can all be friends)", user: penn)
