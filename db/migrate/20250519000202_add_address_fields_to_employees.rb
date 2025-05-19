class AddAddressFieldsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :zip_code, :string
    add_column :employees, :street, :string
    add_column :employees, :complement, :string
    add_column :employees, :neighborhood, :string
    add_column :employees, :city, :string
    add_column :employees, :state, :string
  end
end 