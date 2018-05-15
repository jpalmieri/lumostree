Rails.application.routes.draw do
  get 'my_tree/index'
  get 'my_tree/new'
  post 'my_tree/create'
  get 'my_tree/edit'
  put 'my_tree/update'
  root 'my_tree#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
