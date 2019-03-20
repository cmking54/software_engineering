Rails.application.routes.draw do
    resources :rental_properties
    root "rental_properties#index"
end
