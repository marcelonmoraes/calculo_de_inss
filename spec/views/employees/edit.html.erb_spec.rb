require 'rails_helper'

RSpec.describe "employees/edit", type: :view do
  let(:employee) {
    create(:employee)
  }

  before(:each) do
    assign(:employee, employee)
  end

  it "renders the edit employee form" do
    render

    assert_select "form[action=?][method=?]", employee_path(employee), "post" do
      assert_select "input[name=?]", "employee[name]"
      assert_select "input[name=?]", "employee[salary]"
      assert_select "input[name=?]", "employee[salary_discount]"
      assert_select "input[name=?]", "employee[birth_date]"
      assert_select "input[name=?]", "employee[street]"
      assert_select "input[name=?]", "employee[complement]"
      assert_select "input[name=?]", "employee[neighborhood]"
      assert_select "input[name=?]", "employee[city]"
      assert_select "input[name=?]", "employee[state]"
      assert_select "input[name=?]", "employee[zip_code]"
    end
  end
end
