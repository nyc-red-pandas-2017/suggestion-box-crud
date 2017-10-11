Suggestion.delete_all
User.delete_all

thomas = User.create!(username: "thomas", password: "123456")
penn = User.create!(username: "penn", password: "123456")
david = User.create!(username: "david", password: "123456")

S1 = Suggestion.create!(title: "Get Sleep", body: "It is not a government conspiracy!", user: thomas)
S2 = Suggestion.create!(title: "Eat Dumplings", body: "The are afforable and delicous!", user: thomas)
S3 = Suggestion.create!(title: "Get Revenge", body: "Enough Said", user: penn)
