Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :posts do

  	resource :comments

  	member do
  	  put "like", to: "posts#upvote"
  	end
  end

  root 'posts#index'
end
