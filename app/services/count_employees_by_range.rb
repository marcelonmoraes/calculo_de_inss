class CountEmployeesByRange
  def self.call
    new.call
  end

  def call
    CalcularContribuicaoMensal::TAX_RANGES.map do |range|
      count_employees_in_range(range)
    end
  end

  private

  def count_employees_in_range(range)
    if range[:max] == Float::INFINITY
      Employee.where('salary > ?', range[:min]).count
    else
      Employee.where('salary > ? AND salary <= ?', range[:min], range[:max]).count
    end
  end
end
