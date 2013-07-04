Versa::Application.routes.draw do
  root :to => "root#root"
  devise_for :users

  resources :albums, :only => [:show]
	resources :artists, :only => [:show]
  resources :annotations, :only => [:show, :edit, :update, :destroy] do
    member do
      post 'like'
      post 'dislike'
    end
  end
  resources :songs do
  	member do
  		resources :annotations, :only => [:new, :create]
  	end
  end

end
