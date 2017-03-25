Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'static_pages#index'
  get 'privacy', to: 'static_pages#privacy'
  get 'team', to: 'static_pages#team'
  get 'careers', to: 'static_pages#careers'

  resource :dashboard, only: [:show]

  resources :courses, only: [:index, :show] do
    resources :enrollments, only: [:create]
  end

  resources :lessons, only: [:show]

  namespace :instructor do
    resources :lessons, only: [:update]
    resources :sections, only: [:update] do
      resources :lessons, only: [:create]
    end
    resources :courses, only: [:new, :create, :show, :edit, :update] do
      resources :sections, only: [:create]
    end
  end

end
