Rails.application.routes.draw do
  devise_for :users

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "dashboard#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
