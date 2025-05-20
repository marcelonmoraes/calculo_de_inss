class Employee < ApplicationRecord
  validates :name, presence: true
  validates :birth_date, presence: true
  validates :salary, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :salary_discount, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 951.63 }

  def salary_group
    return "1ª Faixa" if salary.present? && salary <= 1518.00
    return "2ª Faixa" if salary.present? && salary <= 2793.88
    return "3ª Faixa" if salary.present? && salary <= 4190.83

    "4ª Faixa"
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "birth_date", "city", "complement", "created_at", "name", "neighborhood", "salary", "salary_discount", "state", "street", "zip_code" ]
  end
end
