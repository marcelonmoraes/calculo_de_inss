require "rails_helper"

RSpec.describe "Routes", type: :routing do
  describe "Users/Registrations routes" do
    it "routes to devise registrations" do
      expect(get: "/users/sign_up").to route_to("devise/registrations#new")
      expect(post: "/users").to route_to("devise/registrations#create")
      expect(get: "/users/edit").to route_to("devise/registrations#edit")
      expect(put: "/users").to route_to("devise/registrations#update")
      expect(delete: "/users").to route_to("devise/registrations#destroy")
    end
  end
end
