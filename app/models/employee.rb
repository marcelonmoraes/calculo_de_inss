class Employee < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :salary, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :salary_discount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 951.63 }
end
