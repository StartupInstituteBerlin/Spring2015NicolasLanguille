Rails.application.routes.draw do
  resources :ratings

  root 'restourants#index'

  devise_for :users

  # resources :user do
  #   resources :restourants
  # end

  resources :restourants
  resources :reservations, only: [:index,:create]

  get '/restourants/:restourant_id/reservations/new' => 'reservations#new',
  as: :new_reservation_for_restourant

end
