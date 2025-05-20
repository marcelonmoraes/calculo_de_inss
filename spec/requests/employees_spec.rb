require 'rails_helper'

RSpec.describe "/employees", type: :request do
  before do
    sign_in_user
  end

  let(:valid_attributes) {
    {
      name: Faker::Name.name,
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      salary: 1000.00,
      salary_discount: 75.00,
      street: Faker::Address.street_address,
      complement: Faker::Address.secondary_address,
      neighborhood: Faker::Address.community,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip_code: Faker::Address.zip_code
    }
  }

  let(:invalid_attributes) {
    {
      name: Faker::Name.name,
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      salary: nil,
      salary_discount: nil,
      street: Faker::Address.street_address,
      complement: Faker::Address.secondary_address,
      neighborhood: Faker::Address.community,
      city: Faker::Address.city,
      state: Faker::Address.state,
      zip_code: Faker::Address.zip_code
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Employee.create! valid_attributes

      get employees_url

      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      employee = Employee.create! valid_attributes

      get employee_url(employee)

      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_employee_url

      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      employee = Employee.create! valid_attributes

      get edit_employee_url(employee)

      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Employee" do
        expect {
          post employees_url, params: { employee: valid_attributes }
        }.to change(Employee, :count).by(1)
      end

      it "redirects to the created employee" do
        post employees_url, params: { employee: valid_attributes }
        expect(response).to redirect_to(employee_url(Employee.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Employee" do
        expect {
          post employees_url, params: { employee: invalid_attributes }
        }.to change(Employee, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post employees_url, params: { employee: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          salary: 2000.00,
          salary_discount: 157.23
        }
      }

      it "updates the requested employee" do
        employee = Employee.create! valid_attributes

        patch employee_url(employee), params: { employee: new_attributes }
        employee.reload

        expect(employee.salary).to eq(new_attributes[:salary])
        expect(employee.salary_discount).to eq(new_attributes[:salary_discount])
      end

      it "redirects to the employee" do
        employee = Employee.create! valid_attributes

        patch employee_url(employee), params: { employee: new_attributes }
        employee.reload

        expect(response).to redirect_to(employee_url(employee))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        employee = Employee.create! valid_attributes

        patch employee_url(employee), params: { employee: invalid_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested employee" do
      employee = Employee.create! valid_attributes

      expect {
        delete employee_url(employee)
      }.to change(Employee, :count).by(-1)
    end

    it "redirects to the employees list" do
      employee = Employee.create! valid_attributes

      delete employee_url(employee)

      expect(response).to redirect_to(employees_url)
    end
  end
end
