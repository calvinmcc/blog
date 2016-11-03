10.times do
  Tag.create(name: Faker::Music.instrument)
end

tags = Tag.all

100.times do
  Post.create({title: Faker::Company.catch_phrase,
                 body: Faker::Hacker.say_something_smart,
                 category_id: rand(1..7),
                 user_id: rand(1..15),
                 tags: tags.sample(rand(3) + 1)
                 })
end

  # categories = ['Food', 'Sports', 'Health', 'Science', 'Stuff', 'Politics', 'Fashion']
  # categories.each do |category|
  #   Category.create({title: category})
  # end
