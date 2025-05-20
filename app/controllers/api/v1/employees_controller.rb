module Api
  module V1
    class EmployeesController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [ :calculate_discount ]

      def calculate_discount
        calculate_discount_service = CalcularContribuicaoMensal.call(params[:salary])

        if calculate_discount_service.success?
          render json: { salary_discount: calculate_discount_service.discount }
        else
          render json: { error: calculate_discount_service.error_message }, status: :bad_request
        end
      end
    end
  end
end
