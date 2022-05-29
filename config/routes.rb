Rails.application.routes.draw do
  get 'items/show'
  get 'items/index'
  get 'genres/index'
  get 'deliveries/index'
  get 'deliveries/edit'
  get 'homes/top'
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
