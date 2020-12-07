Rails.application.routes.draw do
  resources :interest_calculations

  root 'interest_calculations#new'
end
