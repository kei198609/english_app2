Rails.application.routes.draw do
  root to: 'tops#index'

  devise_for :users, skip: [:sessions, :passwords, :registrations]

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }
      resources :users do
        member do
          get :following, :followers, :following_status
          post :follow, :unfollow
        end
        get :bookmarks, on: :collection
      end

      resources :posts, only: [:index, :new, :create, :show, :destroy] do
        resources :bookmarks, only: [:index, :create, :destroy]
        resource :likes, only: [:create, :destroy]
        resources :comments, only:[:create, :destroy]
      end

      put '/users/:id/avatar', to: 'users#update_avatar'

    end
  end

  devise_scope :user do #deviseのsessionsコントローラーに新しいactionを追加するためにはdevise_scopeと書く
    get  'users/account'       => 'users/registrations#account'
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end


  def devise_scope(scope)
    constraint = lambda do |request|
      request.env["devise.mapping"] = Devise.mappings[scope]
      true
    end

    constraints(constraint) do
      yield
    end
  end

  # 上記apiにしたので削除予定
  # resources :posts, only: [:new, :create, :show, :destroy] do
  #   resources :bookmarks, only: [:index, :create, :destroy]
  #   resource :likes, only: [:create, :destroy]
  #   resources :comments, only:[:create, :destroy]
  # end

  # 上記apiにしたので削除予定
  # resources :users do
  #   member do
  #     get :following, :followers
  #   end
  #   get :bookmarks, on: :collection
  # end

  resources :relationships, only: [:create, :destroy]
  resources :notifications, only: :index
end
