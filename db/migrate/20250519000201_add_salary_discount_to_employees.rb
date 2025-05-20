class AddSalaryDiscountToEmployees < ActiveRecord::Migration[8.0]
  def change
    add_column :employees, :salary_discount, :decimal, precision: 13, scale: 2
  end
end
