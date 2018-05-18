Rails.application.routes.draw do
  resources :my_tree, only: [:index, :create, :edit, :update]
  root 'my_tree#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
