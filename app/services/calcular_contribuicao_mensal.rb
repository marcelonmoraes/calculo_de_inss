class CalcularContribuicaoMensal
  TAX_RANGES = [
    { min: 0.0, max: 1518.00, rate: 0.075, name: "1ª Faixa" },
    { min: 1518.01, max: 2793.88, rate: 0.09, name: "2ª Faixa" },
    { min: 2793.89, max: 4190.83, rate: 0.12, name: "3ª Faixa" },
    { min: 4190.84, max: 8157.41, rate: 0.14, name: "4ª Faixa" }
  ].freeze

  attr_reader :discount

  def initialize(gross_salary)
    @gross_salary = gross_salary.to_f
  end

  def self.call(gross_salary)
    new(gross_salary).call
  end

  def call
    gross_salary_valid? && calculate_discount

    self
  end

  def calculate_discount
    total_contribution = 0.0

    TAX_RANGES.each do |range|
      break if @gross_salary <= range[:min]

      base_calculation = [ range[:max], @gross_salary ].min - range[:min]
      contribution_range = base_calculation * range[:rate]
      total_contribution += contribution_range
    end

    @discount = total_contribution.round(2)

    true
  end

  def success?
    @gross_salary.positive?
  end

  def error_message
    "salário inválido"
  end

  private

  private_class_method :new
  attr_accessor :gross_salary
  attr_writer :discount

  def gross_salary_valid?
    return false if @gross_salary.nil? || @gross_salary.zero? || @gross_salary.negative?
    return false if @gross_salary.to_s.strip.empty?

    true
  end
end
