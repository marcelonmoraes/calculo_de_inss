class FormatSalaryRanges
  include ActionView::Helpers::NumberHelper

  def self.call
    new.call
  end

  def call
    CalcularContribuicaoMensal::TAX_RANGES.map do |range|
      format_range(range)
    end
  end

  private

  def format_range(range)
    if range[:max] == Float::INFINITY
      "Acima de R$ #{number_with_precision(range[:min], precision: 2)}"
    else
      "R$ #{number_with_precision(range[:min], precision: 2)} - R$ #{number_with_precision(range[:max], precision: 2)}"
    end
  end
end
