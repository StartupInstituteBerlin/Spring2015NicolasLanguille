Rails.application.routes.draw do
  root 'restourants#index'

  devise_for :users

  resources :ratings
  resources :restourants
  resources :reservations, only: [:index,:create]

  get '/restourants/:restourant_id/reservations/new' => 'reservations#new',
  as: :new_reservation_for_restourant

  get 'restourant/:restourant_id/rating_id/:value' => 'restourants#rate_restourant',
  as: :rate_restourant

end
