class EmployeeContact < ApplicationRecord
  belongs_to :employee, inverse_of: :employee_contacts

  enum :contact_type, {
    email: 0,
    mobile: 1,
    phone: 2,
    whatsapp: 3,
    address: 4
  }

  validates :contact_type, :value, presence: true
end
