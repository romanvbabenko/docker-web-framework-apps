# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:f_name) { |n| "#{Faker::Name.first_name}#{n}" }
    sequence(:l_name) { |n| "#{Faker::Name.last_name}#{n}" }
  end
end
