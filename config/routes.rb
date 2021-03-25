Rails.application.routes.draw do
  resources :grouped_payments
  resources :payments
  resources :groups
  devise_for :users, :controllers => { registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#show"
  get "/users/:id", to: "users#show", :as => :user_show
  get "/ungrouped_payments", to: "payments#ungrouped_index", :as => :ungrouped_payments
end
