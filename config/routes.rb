Rails.application.routes.draw do

  resources :images, only:[ :show, :new, :index, :create ] do
    member do
      get 'data'
    end
    resources :words, only: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
