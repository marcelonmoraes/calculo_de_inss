class EmployeeMailer < ApplicationMailer
  def new_employee_notification(employee, user_email)
    @employee = employee
    @user_email = user_email

    mail(
      to: "rh@calculoinss.com.br",
      subject: "Novo funcionário cadastrado"
    )
  end
end
