User.delete_all
Suggestion.delete_all

5.times do
  user = User.create!(name: Faker::Name.name, password: Faker::Lorem.word)
  suggestion = Suggestion.create!(title: Faker::Lorem.word,
    description: Faker::Lorem.sentence, user_id: user.id)
end

5.times do
  user = User.create!(name: Faker::Name.name, password: Faker::Lorem.word)
  suggestion = Suggestion.create!(title: Faker::Lorem.word,
    description: Faker::Lorem.sentence, user_id: user.id)
end

5.times do
  user = User.create!(name: Faker::Name.name, password: Faker::Lorem.word)
  suggestion = Suggestion.create!(title: Faker::Lorem.word,
    description: Faker::Lorem.sentence, user_id: user.id)
end

5.times do
  user = User.create!(name: Faker::Name.name, password: Faker::Lorem.word)
  suggestion = Suggestion.create!(title: Faker::Lorem.word,
    description: Faker::Lorem.sentence, user_id: user.id)
end
