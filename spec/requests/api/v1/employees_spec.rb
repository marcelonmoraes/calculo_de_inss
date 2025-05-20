require 'rails_helper'

RSpec.describe "Api::V1::Employees", type: :request do
  before do
    sign_in_user
  end

  describe "POST /calculate_discount" do
    it "returns the salary discount based on the salary R$ 0.00" do
      post api_v1_employees_calculate_discount_path, params: { salary: 0.00 }

      expect(response).to have_http_status(:bad_request)
      expect(response.body).to eq({ error: "salário inválido" }.to_json)
    end    

    it "returns the salary discount based on the salary R$ 1000.00" do
      post api_v1_employees_calculate_discount_path, params: { salary: 1000.00 }

      expect(response).to be_successful
      expect(response.body).to eq({ salary_discount: 75.00 }.to_json)
    end

    it "returns the salary discount based on the salary R$ 2000.00" do
      post api_v1_employees_calculate_discount_path, params: { salary: 2000.00 }

      expect(response).to be_successful
      expect(response.body).to eq({ salary_discount: 157.23 }.to_json)
    end

    it "returns the salary discount based on the salary R$ 3000.00" do
      post api_v1_employees_calculate_discount_path, params: { salary: 3000.00 }

      expect(response).to be_successful
      expect(response.body).to eq({ salary_discount: 253.41 }.to_json)
    end

    it "returns the salary discount based on the salary R$ 5000.00" do
      post api_v1_employees_calculate_discount_path, params: { salary: 5000.00 }

      expect(response).to be_successful
      expect(response.body).to eq({ salary_discount: 509.59 }.to_json)
    end

    it "returns the salary discount based on the salary R$ 10000.00" do
      post api_v1_employees_calculate_discount_path, params: { salary: 10000.00 }

      expect(response).to be_successful
      expect(response.body).to eq({ salary_discount: 951.63 }.to_json)
    end
  end
end
