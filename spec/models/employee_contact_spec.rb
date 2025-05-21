require 'rails_helper'

RSpec.describe EmployeeContact, type: :model do
  describe "associations" do
    it { should belong_to(:employee) }
  end

  describe "validations" do
    it { should validate_presence_of(:contact_type) }
    it { should validate_presence_of(:value) }
  end
end
