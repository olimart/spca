Rails.application.routes.draw do

  resources :animals

  # USER ROUTES
  # ----------------------------------------------------------------------------
  delete 'logout'               => 'sessions#destroy',     as: 'logout'
  get    'login'                => 'sessions#new',         as: 'login'
  get    'signup'               => 'registrations#new',    as: 'signup'
  get    'profile'              => 'registrations#edit',   as: 'profile'
  post   'profile'              => 'registrations#update', as: 'update_profile'
  get    'paswords/:token/edit' => 'passwords#edit',       as: 'change_password'
  resource  :password, only: [:new, :create, :edit, :update]
  resources :registrations, except: [:index, :show, :destroy]
  resources :sessions


  # ADMIN ROUTES
  # ----------------------------------------------------------------------------
  scope module: 'admin', path: 'adm1nistr8tion', as: 'admin' do
    root to: 'dashboard#show', as: :dashboard
  end


  # PUBLIC ROUTES
  # ----------------------------------------------------------------------------
  post 'search' => 'licences#search', as: 'search_licences'
  resources :payments, only: [:new, :create]

  root 'licences#renew'

end
