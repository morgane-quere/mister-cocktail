Rails.application.routes.draw do  
  get 'doses/new'
  get 'doses/create'
  get 'doses/destroy'
  resources :cocktails, only: [:index, :show, :create, :new] do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
