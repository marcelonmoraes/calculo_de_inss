class CreateEmployeeContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :employee_contacts do |t|
      t.references :employee, null: false, foreign_key: true
      t.integer :contact_type
      t.string :value

      t.timestamps
    end
  end
end
