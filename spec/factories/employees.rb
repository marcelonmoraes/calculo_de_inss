FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    birth_date { DateTime.current - 18.years }
    salary { 1000.0 }
    salary_discount { 75.0 }
  end
end
