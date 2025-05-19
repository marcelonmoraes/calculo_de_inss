class CalcularContribuicaoMensal
  TAX_RANGES = [
    { min: 0.0, max: 1518.00, rate: 0.075, name: "1ª Faixa" },
    { min: 1518.01, max: 2793.88, rate: 0.09, name: "2ª Faixa" },
    { min: 2793.89, max: 4190.83, rate: 0.12, name: "3ª Faixa" },
    { min: 4190.84, max: 8157.41, rate: 0.14, name: "4ª Faixa" }
  ].freeze

  def initialize(salario_bruto)
    @salario_bruto = salario_bruto.to_f
  end

  def self.calcular(salario_bruto)
    new(salario_bruto).calcular
  end

  def calcular
    return 0.0 if @salario_bruto <= 0

    total_contribuicao = 0.0

    TAX_RANGES.each do |range|
      break if @salario_bruto <= range[:min]

      base_calculo = [ range[:max], @salario_bruto ].min - range[:min]
      contribuicao_faixa = base_calculo * range[:rate]
      total_contribuicao += contribuicao_faixa
    end

    total_contribuicao.round(2)
  end

  private

  private_class_method :new
end
