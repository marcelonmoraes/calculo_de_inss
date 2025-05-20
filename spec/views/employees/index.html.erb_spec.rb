require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  include EmployeesHelper

  before(:each) do
    assign(:q, Employee.ransack)
    employees = [
      create(:employee,
        name: "John Doe",
        birth_date: Date.new(1990, 1, 1),
        salary: 1000.00,
        salary_discount: 75.00,
        street: "Rua A",
        complement: "Apto 1",
        neighborhood: "Centro",
        city: "São Paulo",
        state: "SP",
        zip_code: "01234-567"
      ),
      create(:employee,
        name: "Jane Smith",
        birth_date: Date.new(1992, 2, 2),
        salary: 2000.00,
        salary_discount: 157.23,
        street: "Rua B",
        complement: "Apto 2",
        neighborhood: "Jardim",
        city: "Rio de Janeiro",
        state: "RJ",
        zip_code: "89012-345"
      )
    ]
    assign(:employees, Employee.where(id: employees.map(&:id)).page(1))
  end

  it "renders a list of employees" do
    render

    # Verifica o título e botão de novo funcionário
    expect(rendered).to match(/<h1 class="h2 mb-0">Funcionários<\/h1>/)
    expect(rendered).to match(/<a class="btn btn-primary" href="\/employees\/new">/)

    # Verifica os cabeçalhos da tabela
    expect(rendered).to match(/<th><a[^>]*class="sort_link[^>]*>[^<]*Nome<\/a><\/th>/)
    expect(rendered).to match(/<th><a[^>]*class="sort_link[^>]*>[^<]*Data de Nascimento<\/a><\/th>/)
    expect(rendered).to match(/<th><a[^>]*class="sort_link[^>]*>[^<]*Salário<\/a><\/th>/)
    expect(rendered).to match(/<th><a[^>]*class="sort_link[^>]*>[^<]*Desconto<\/a><\/th>/)
    expect(rendered).to match(/<th>Faixa Salarial<\/th>/)
    expect(rendered).to match(/<th>Ações<\/th>/)

    # Verifica os dados do primeiro funcionário
    expect(rendered).to match(/<td>John Doe<\/td>/)
    expect(rendered).to match(/<td>01\/01\/1990<\/td>/)
    expect(rendered).to match(/<td>R\$1\.000,00<\/td>/)
    expect(rendered).to match(/<td>R\$75,00<\/td>/)
    expect(rendered).to match(/<span class="badge rounded-pill bg-success bg-gradient">1ª Faixa<\/span>/)

    # Verifica os dados do segundo funcionário
    expect(rendered).to match(/<td>Jane Smith<\/td>/)
    expect(rendered).to match(/<td>02\/02\/1992<\/td>/)
    expect(rendered).to match(/<td>R\$2\.000,00<\/td>/)
    expect(rendered).to match(/<td>R\$157,23<\/td>/)
    expect(rendered).to match(/<span class="badge rounded-pill bg-light bg-gradient text-dark">2ª Faixa<\/span>/)
  end
end
