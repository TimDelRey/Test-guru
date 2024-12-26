# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :tests do
    resources :questions, except: :show, shallow: true

    member do
      post :start
    end
  end

  resources :sessions, only: :create

  resources :categories #do
  #   resources :tests, only: [], shallow: true
  # end

  resources :users #do
  #   resources :tests, only: [], shallow: true
  # end

  resources :questions, only: %i[] do
    resources :answers, except: :index, shallow: true
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  root to: 'tests#index'

  # get '/questions/:id/delete', to: 'questions#destroy'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'
end
