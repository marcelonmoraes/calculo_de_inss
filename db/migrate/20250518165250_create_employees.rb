class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.date :birth_date
      t.decimal :salary, precision: 13, scale: 2

      t.timestamps
    end
  end
end
