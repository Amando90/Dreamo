Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do

  	resource :comments

  	member do
  	  put "like", to: "posts#upvote"
  	end
  end

  root 'posts#index'

  get ':user_name', to: 'profiles#show', as: :profile
end
