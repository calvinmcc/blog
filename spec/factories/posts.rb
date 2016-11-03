FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "blog title #{n}" }
    body { Faker::Hipster.paragraph }
  end
end
