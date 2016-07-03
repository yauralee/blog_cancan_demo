FactoryGirl.define do
  factory :user do
    name 'liyu'
    email 'liyu@example.com'
    uid { Faker::Number.number(10) }
    category 'normal'
  end
end