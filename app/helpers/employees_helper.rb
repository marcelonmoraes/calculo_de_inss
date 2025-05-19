module EmployeesHelper
  def format_salary_group(salary)
    return content_tag(:span, "1ª Faixa", class: "badge bg-success") if salary <= CalcularContribuicaoMensal::TAX_RANGES[0][:max]
    return content_tag(:span, "2ª Faixa", class: "badge bg-info") if salary <= CalcularContribuicaoMensal::TAX_RANGES[1][:max]
    return content_tag(:span, "3ª Faixa", class: "badge bg-warning") if salary <= CalcularContribuicaoMensal::TAX_RANGES[2][:max]
    
    content_tag(:span, "4ª Faixa", class: "badge bg-danger")
  end
end
