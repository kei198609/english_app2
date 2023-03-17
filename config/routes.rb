Rails.application.routes.draw do
  root to: 'tops#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations' #deviseのregistrationsコントローラーの部分が、users/registrationsを参照するようになる
  }

  devise_scope :user do #deviseのsessionsコントローラーに新しいactionを追加するためにはdevise_scopeと書く
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end

  # devise_scope :user do
  #   get 'mypages/home' => 'users/registrations#home'
  # end

  def devise_scope(scope)
    constraint = lambda do |request|
      request.env["devise.mapping"] = Devise.mappings[scope]
      true
    end

    constraints(constraint) do
      yield
    end
  end


  # resources :posts, only: [:new, :create, :show, :destroy]
  resources :posts, only: [:new, :create, :show, :destroy] do
    resources :bookmarks, only: [:create, :destroy]
  end



  resources :users do
    member do
      get :following, :followers
    end
    get :bookmarks, on: :collection
  end

  resources :relationships, only: [:create, :destroy]

end
