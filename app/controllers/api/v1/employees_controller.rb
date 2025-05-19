module Api
  module V1
    class EmployeesController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:calculate_discount]

      def calculate_discount
        salary = params[:salary].to_f
        discount = CalcularContribuicaoMensal.calcular(salary)

        render json: { salary_discount: discount }
      end
    end
  end
end
