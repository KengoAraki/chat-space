require 'faker'

FactoryGirl.define do
  factory :message do
    body       Faker::Lorem.sentence
    image      Faker::Avatar.image
    group_id   Faker::Number.between(1, 100)
    user_id    Faker::Number.between(1, 100)
    created_at Faker::Time.between(2.days.ago, Time.now, :all)
  end
end