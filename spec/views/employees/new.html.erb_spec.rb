require 'rails_helper'

RSpec.describe "employees/new", type: :view do
  before(:each) do
    assign(:employee, Employee.new(
      name: "MyString",
      salary: "9.99"
    ))
  end

  it "renders new employee form" do
    render

    assert_select "form[action=?][method=?]", employees_path, "post" do
      assert_select "input[name=?]", "employee[name]"
      assert_select "input[name=?]", "employee[salary]"
      assert_select "input[name=?]", "employee[birth_date]"
      assert_select "input[name=?]", "employee[salary_discount]"
      assert_select "input[name=?]", "employee[street]"
      assert_select "input[name=?]", "employee[complement]"
      assert_select "input[name=?]", "employee[neighborhood]"
      assert_select "input[name=?]", "employee[city]"
      assert_select "input[name=?]", "employee[state]"
      assert_select "input[name=?]", "employee[zip_code]"
    end
  end
end
