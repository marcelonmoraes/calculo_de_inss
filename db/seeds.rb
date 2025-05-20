Employee.delete_all

10.times do
  salary = Faker::Number.between(from: 1000, to: 10000)
  salary_discount = CalcularContribuicaoMensal.calcular(salary)

  Employee.create(
    name: Faker::Name.name,
    birth_date: Faker::Date.between(from: 18.years.ago, to: 65.years.ago),
    salary: salary,
    salary_discount: salary_discount
  )
end
