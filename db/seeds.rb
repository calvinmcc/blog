20.times do
  Tag.create(name: Faker::Commerce.department)
end

tags = Tag.all

20.times do
  User.create({first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               email: Faker::Internet.email,
               password: Faker::Internet.password })
end

categories = ['Food', 'Sports', 'Health', 'Science', 'Stuff', 'Politics', 'Fashion']
categories.each do |category|
  Category.create({title: category})
end

100.times do
  Post.create({title: Faker::Company.catch_phrase,
                 body: Faker::Hacker.say_something_smart,
                 category_id: rand(1..7),
                 user_id: rand(1..15),
                 tags: tags.sample(rand(3) + 1)
                 })
end
