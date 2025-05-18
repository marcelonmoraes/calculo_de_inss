FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
    confirmed_at { Time.current }
  end
end
