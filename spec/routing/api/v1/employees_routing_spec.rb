require "rails_helper"

RSpec.describe "Routes", type: :routing do
  describe "API V1 Employees routes" do
    it "routes to #calculate_discount" do
    expect(post: "/api/v1/employees/calculate_discount").to route_to(
      controller: "api/v1/employees",
        action: "calculate_discount",
        format: :json
      )
    end
  end
end
