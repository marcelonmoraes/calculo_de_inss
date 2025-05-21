FactoryBot.define do
  factory :employee_contact do
    employee { nil }
    contact_type { 1 }
    value { "MyString" }
  end
end
