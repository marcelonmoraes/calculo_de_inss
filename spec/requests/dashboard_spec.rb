require 'rails_helper'

RSpec.describe "Dashboards", type: :request do
  describe "GET /" do
    before do
      sign_in_user
    end

    it "returns http success" do
      get "/"

      expect(response).to have_http_status(:success)
    end
  end
end
