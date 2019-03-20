Rails.application.routes.draw do
  devise_for :users

  resources :sights, :only => [:index, :show]
  root to: 'sights#index'

  post '/sights/:id/upvote', to: 'up_down_votes#upvote', as: :upvote
  post '/sights/:id/downvote', to: 'up_down_votes#downvote', as: :downvote
  post '/sights/:id/comments', to: 'comments#create', as: :comments
end
