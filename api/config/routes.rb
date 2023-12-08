Rails.application.routes.draw do
  root to: 'tops#index'

  devise_for :users, skip: [:sessions, :passwords, :registrations]

  namespace :api do
    namespace :v1 do
      get 'articles/index'
      get 'categories/index'
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations',
        sessions: 'api/v1/auth/sessions'
      }

      devise_scope :user do #deviseのsessionsコントローラーに新しいactionを追加するためにはdevise_scopeと書く
        post 'auth/sessions/guest_sign_in', to: 'auth/sessions#guest_sign_in', as: :guest_sign_in
      end

      resources :users do
        member do
          get :following, :followers, :following_status
          get :quiz_statistics
          get :article_statistics
          post :follow, :unfollow
        end
        get :bookmarks, on: :collection
      end

      resources   :posts,     only: [:index, :new, :create, :show, :destroy] do
        resources :bookmarks, only: [:create, :destroy]
        resource  :likes,     only: [:create, :destroy]
        resources :comments,  only: [:create, :destroy]
      end

      resources :notifications,    only: [:index]
      resources :quizzes,          only: [:index, :show]
      resources :categories,       only: [:index]
      resources :quiz_attempts,    only: [:index, :create]
      resources :articles,         only: [:index, :show]
      resources :article_readings, only: [:create] do
        collection do
          get :user_articles_read
        end
      end

      put '/users/:id/avatar', to: 'users#update_avatar'

    end
  end
end
