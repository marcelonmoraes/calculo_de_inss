require 'rails_helper'

RSpec.describe "dashboard/index", type: :view do
  let(:user) { create(:user) }
  let(:employees) do
    [
      create(:employee, salary: 1000.0),
      create(:employee, salary: 2000.0),
      create(:employee, salary: 3000.0)
    ]
  end

  before do
    assign(:total_employees, employees.count)
    assign(:average_salary, employees.sum(&:salary) / employees.count)
    assign(:salary_ranges, [ "Até R$ 1.000", "R$ 1.001 - R$ 2.000", "R$ 2.001 - R$ 3.000" ])
    assign(:employee_counts, [ 1, 1, 1 ])
    render
  end

  it "displays the total number of employees" do
    expect(rendered).to match(/Total de Funcionários/)
    expect(rendered).to match(/3/)
  end

  it "displays the average salary" do
    expect(rendered).to match(/Média Salarial/)
    expect(rendered).to match(/R\$ 2000.00/)
  end
end
