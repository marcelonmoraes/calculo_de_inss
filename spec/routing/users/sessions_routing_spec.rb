require "rails_helper"

RSpec.describe "Routes", type: :routing do
  describe "Users/Sessions routes" do
    it "routes to devise sessions" do
      expect(get: "/users/sign_in").to route_to("devise/sessions#new")
      expect(post: "/users/sign_in").to route_to("devise/sessions#create")
      expect(delete: "/users/sign_out").to route_to("devise/sessions#destroy")
    end
  end
end
