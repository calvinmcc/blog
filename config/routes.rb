
Rails.application.routes.draw do

 get '/' => 'home#index', as: :home

 get '/about' => 'home#about'

resources :posts do
  resources :comments, only: [:new, :create, :destroy]
  resources :favorites, only: [:create, :destroy]
end

resources :tags, only: [:show, :index]

resources :categories

resources :users
resources :passwords, only: [:edit, :update]

resources :sessions do
  get :edit, on: :collection
  delete :destroy, on: :collection
end

resources :recoveries

end
