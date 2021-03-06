Versa::Application.routes.draw do
  root :to => "root#root"
  devise_for :users, :controllers => {
    :omniauth_callbacks => "omniauth_callbacks"
  }

  resources :albums, :only => [:show]
	resources :artists, :only => [:index, :show, :update] do
    collection do
      get 'search'
    end
  end
  resources :annotations do
    member do
      post 'like'
      post 'dislike'
    end
  end

  resources :songs do
    collection do
      get 'search'
    end
  	member do
  		resources :annotations, :only => [:new, :create]
  	end
  end

  get 'guest', to: 'root#guest'
  get 'log_out', to: 'root#log_out'

  resources :users, :only=> [:index, :show] do
    member do
      resources :followings, :only => :create do
        collection do
          delete 'destroy'
        end
      end
    end
  end

end
