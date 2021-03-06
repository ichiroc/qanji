# frozen_string_literal: true
Rails.application.routes.draw do
  root 'images#new'
  resources :images, only: [:show, :new, :index, :create] do
    member do
      get 'data'
    end
    resources :words, only: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
