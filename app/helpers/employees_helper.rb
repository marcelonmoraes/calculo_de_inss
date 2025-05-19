module EmployeesHelper
  def format_salary_group(salary)
    return content_tag(:span, "1ª Faixa", class: "badge rounded-pill bg-success bg-gradient") if salary <= CalcularContribuicaoMensal::TAX_RANGES[0][:max]
    return content_tag(:span, "2ª Faixa", class: "badge rounded-pill bg-light bg-gradient text-dark") if salary <= CalcularContribuicaoMensal::TAX_RANGES[1][:max]
    return content_tag(:span, "3ª Faixa", class: "badge rounded-pill bg-warning bg-gradient") if salary <= CalcularContribuicaoMensal::TAX_RANGES[2][:max]

    content_tag(:span, "4ª Faixa", class: "badge rounded-pill bg-danger bg-gradient")
  end
end
