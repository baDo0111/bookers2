Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root'home#top'
	get '/home/about', to: 'home#about'
  resources :books, only:[:new, :create, :index, :show, :destroy,:edit,:update]
  resources :users, only:[:new,:index,:show, :update, :edit]

  resources :books, only: [:new, :create, :index, :show] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end

  resources :users do
  resource :relationships, only: [:create, :destroy]
      member do
       get :following, :followers
      end
    end
    resources :parents
   get 'relationships/create'
   get 'relationships/destroy'
end
