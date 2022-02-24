# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :competitions, only: %i[index show] do
    resources :participants, only: %i[create new]
  end

  resources :teams, only: [:index]
end
