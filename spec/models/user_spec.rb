require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }

  context "when email is not unique" do
    let(:user) { create(:user) }
    let(:user2) { build(:user, email: user.email) }

    it "is not valid" do
      expect(user2).not_to be_valid
    end
  end
end
