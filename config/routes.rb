Rails.application.routes.draw do
  resources :document_academics
  resources :academics
  resources :clinicals
  get 'document_family/index'
  mount Judge::Engine => '/judge'
  # ActiveAdmin.routes(self)
  # devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords'}
  namespace :dynamic_selectable do
    get 'departments/:department_id/functions', to: 'department_functions#index', as: :department_functions
    get 'directions/:direction_id/departments', to: 'direction_departments#index', as: :direction_departments
    get 'general_directions/:general_direction_id/directions', to: 'general_direction_directions#index', as: :general_direction_directions
  end


  resources :general_directions
  resources :functions
  resources :departments
  resources :directions
  resources :labors

  get '/unexpired_contracts' => 'labors#unexpired_contracts'
  get '/full_age' => 'family_groups#full_age'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, path: '/', only: [:sessions]
  devise_scope :user do
  	get "login", to: "devise/sessions#new"

    authenticated :user, lambda {|u| u.role == "admin"} do
      root to: "home#index", as: :authenticated_root
    end

    authenticated :user, lambda {|u| u.role == "none"} do
      root to: "home#index"
    end

    unauthenticated :user do
      root :to => 'users/sessions#new', as: :unauthenticated_root
    end
  end


	get 'home/index'

	resources :family_groups do
    member do
      get 'download'
    end
  end


	resources :employees do
		member do
  		post "pdf"
      get 'download'
  	end
	end

  resources :home do
    member do
      post "listpdf"
    end
  end

end
