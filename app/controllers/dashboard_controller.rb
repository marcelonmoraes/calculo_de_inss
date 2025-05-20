class DashboardController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    @salary_ranges = FormatSalaryRanges.call
    @employee_counts = CountEmployeesByRange.call
    @total_employees = Employee.count
    @average_salary = Employee.average(:salary).to_f
  end
end
