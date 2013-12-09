Blog::Application.routes.draw do
  resources :activities
  resources :users do
    resources :albums do
      resources :images
    end
    resources :friendships
    resources :microposts do
      resources :like_microposts
      resources :comments do
        resources :like_comments
      end
    end
  end
  resources :sessions,   only: [:new, :create, :destroy]
  resources :groups do
    resources :group_microposts do
      resources :like_group_microposts
      resources :group_comments do
        resources :like_group_comments
      end
    end
  end

  resources :group_members, only: [:create, :destroy]

  root  'blog#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
