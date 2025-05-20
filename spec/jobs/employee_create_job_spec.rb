require 'rails_helper'

RSpec.describe EmployeeCreateJob, type: :job do
  describe "perform" do
    it "sends a notification email to the admin" do
      employee = create(:employee)
      user = create(:user)

      expect {
        described_class.perform_later(employee.id, user.email)
      }.to have_enqueued_job.with(employee.id, user.email)
    end
  end
end
