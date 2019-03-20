Rails.application.routes.draw do

  get "/about" => 'meetings#about'
  get "/leaderboard" => 'people#leaderboard'
  get "/contact" => 'main#contact'
  get "/pending" => 'main#pending'
  get "/my_meetings" => 'people#my_meetings'
  get "/who_registered" => 'meetings#who_registered'

  resources :people
  resources :meetings
  resources :registrations
  root to: 'main#general'

  get 'signout', to: 'people#logout', as: 'signout'
  devise_for :people, controllers: { omniauth_callbacks: 'people' }

end
