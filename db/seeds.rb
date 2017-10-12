User.delete_all
Suggestion.delete_all

5.times do
  user = User.create!(name: Faker::Name.name)
  suggestion = Suggestion.create!(title: Faker::Lorem.word,
    description: Faker::Lorem.sentence)
end

5.times do
  user = User.create
  suggestion = Suggestion.create!(title: Faker::Lorem.word,
    description: Faker::Lorem.sentence)
end

5.times do
  user = User.create!(name: Faker::Name.name)
  suggestion = Suggestion.create!(title: Faker::Lorem.word,
    description: Faker::Lorem.sentence)
end

5.times do
  user = User.create
  suggestion = Suggestion.create!(title: Faker::Lorem.word,
    description: Faker::Lorem.sentence)
end
