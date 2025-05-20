require 'rails_helper'

RSpec.describe "employees/show", type: :view do
  include EmployeesHelper

  before(:each) do
    @employee = assign(:employee, Employee.create!(
      name: Faker::Name.name,
      salary: 1000.0,
      salary_discount: 75.0,
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      street: Faker::Address.street_address,
      complement: Faker::Address.secondary_address,
      neighborhood: Faker::Address.community,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip_code: Faker::Address.zip_code
    ))
  end

  it "renders attributes" do
    render

    expect(rendered).to match(/Nome/)
    expect(rendered).to match(@employee.name)
    expect(rendered).to match(/Data de Nascimento/)
    expect(rendered).to match(@employee.birth_date.strftime("%d/%m/%Y"))
    expect(rendered).to match(/Salário/)
    expect(rendered).to match("1.000,00")
    expect(rendered).to match(/Desconto/)
    expect(rendered).to match("75,00")
    expect(rendered).to match(/Faixa de Salário/)
    expect(rendered).to match(/1ª Faixa/)
  end
end
