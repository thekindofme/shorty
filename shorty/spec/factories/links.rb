require 'faker'

FactoryGirl.define do
  factory :link do
    url Faker::Internet.url
  end
end
