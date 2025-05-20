require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'validations' do
    subject { build(:employee) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:birth_date) }
    it { is_expected.to validate_presence_of(:salary) }
    it { is_expected.to validate_presence_of(:salary_discount) }
    it { is_expected.to validate_numericality_of(:salary).is_greater_than_or_equal_to(0) }
    it { is_expected.to validate_numericality_of(:salary_discount).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(951.63) }
  end
end
