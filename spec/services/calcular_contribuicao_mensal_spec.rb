require 'rails_helper'

RSpec.describe CalcularContribuicaoMensal do
  describe '.calcular' do
    context 'when salary is zero or negative' do
      it 'returns zero' do
        expect(described_class.calcular(0)).to eq(0.0)
        expect(described_class.calcular(-1000)).to eq(0.0)
      end
    end

    context 'when salary is in first bracket' do
      it 'calculates correctly' do
        # 1000 * 0.075 = 75.00
        expect(described_class.calcular(1000)).to eq(75.0)
      end
    end

    context 'when salary is in second bracket' do
      it 'calculates correctly' do
        # First bracket: 1518.00 * 0.075 = 113.85
        # Second bracket: (2000 - 1518.01) * 0.09 = 43.38
        # Total: 113.85 + 43.38 = 157.23
        expect(described_class.calcular(2000)).to eq(157.23)
      end
    end

    context 'when salary is in third bracket' do
      it 'calculates correctly' do
        # First bracket: 1518.00 * 0.075 = 113.85
        # Second bracket: (2793.88 - 1518.01) * 0.09 = 114.74
        # Third bracket: (3000 - 2793.89) * 0.12 = 24.62
        # Total: 113.85 + 114.74 + 24.62 = 253.41
        expect(described_class.calcular(3000)).to eq(253.41)
      end
    end

    context 'when salary is in fourth bracket' do
      it 'calculates correctly' do
        # First bracket: 1518.00 * 0.075 = 113.85
        # Second bracket: (2793.88 - 1518.01) * 0.09 = 114.74
        # Third bracket: (4190.83 - 2793.89) * 0.12 = 167.63
        # Fourth bracket: (5000 - 4190.84) * 0.14 = 113.39
        # Total: 113.85 + 114.74 + 167.63 + 113.39 = 509.59
        expect(described_class.calcular(5000)).to eq(509.59)
      end
    end

    context 'when salary is above maximum bracket' do
      it 'calculates up to maximum bracket' do
        # First bracket: 1518.00 * 0.075 = 113.85
        # Second bracket: (2793.88 - 1518.01) * 0.09 = 114.83
        # Third bracket: (4190.83 - 2793.89) * 0.12 = 167.63
        # Fourth bracket: (8157.41 - 4190.84) * 0.14 = 557.32
        # Total: 113.85 + 114.83 + 167.63 + 557.32 = 951.63
        expect(described_class.calcular(10000)).to eq(951.63)
      end
    end
  end
end
