class EmployeeCreateJob < ApplicationJob
  queue_as :default

  def perform(employee_id, user_email)
    employee = Employee.find(employee_id)
    EmployeeMailer.new_employee_notification(employee, user_email).deliver_now
  end
end
