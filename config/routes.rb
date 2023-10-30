# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    resources :admins # Administradores
    resources :subjects # Assuntos/Áreas
    resources :questions # Questões
    delete 'admins/destroy/:id', to: 'admins#destroy'
    get 'welcome/index' # Dashboard
  end

  devise_for :users
  devise_for :admins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'site/welcome#index'
end
