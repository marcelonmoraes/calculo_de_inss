Ransack.configure do |config|
  config.add_predicate "salary_group_eq",
    arel_predicate: "in",
    formatter: proc { |v|
      case v
      when "1ª Faixa"
        [ 0.0..1518.00 ]
      when "2ª Faixa"
        [ 1518.01..2793.88 ]
      when "3ª Faixa"
        [ 2793.89..4190.83 ]
      when "4ª Faixa"
        [ 4190.84..Float::INFINITY ]
      end
    },
    validator: proc { |v| v.present? },
    compounds: false,
    type: :string,
    formatter: proc { |v|
      case v
      when "1ª Faixa"
        [ 0.0..1518.00 ]
      when "2ª Faixa"
        [ 1518.01..2793.88 ]
      when "3ª Faixa"
        [ 2793.89..4190.83 ]
      when "4ª Faixa"
        [ 4190.84..Float::INFINITY ]
      end
    }
end
