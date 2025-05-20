Rails.application.routes.draw do
  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :employees

  root "dashboard#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post "employees/calculate_discount", to: "employees#calculate_discount"
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
