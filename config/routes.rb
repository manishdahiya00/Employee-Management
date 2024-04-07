Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  root to: 'company#index'
  get 'sign_up' => 'registration#new'
  post 'sign_up' => 'registration#create'
  delete 'logout' => 'login#destroy'
  get 'login' => 'login#new'
  post 'login' => 'login#create'
  get 'password' => 'password#edit'
  patch 'password' => 'password#update'
end
