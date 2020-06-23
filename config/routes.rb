Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root'home#top'
	get '/home/about', to: 'home#about'
  resources :books, only:[:new, :create, :index, :show, :destroy,:edit,:update]
  resources :users, only:[:new,:index,:show, :update, :edit]
end
