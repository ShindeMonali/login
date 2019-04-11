Rails.application.routes.draw do
  get 'user/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user#index'
 # get 'user/user_login'

  # get 'user/sign_in'
  # post 'user/sign_in', to: 'user#sign_in'

  get 'user/show'
  # post 'user/show', to: 'user#sign_in'


  get 'user/about'
  post 'user/about', to: 'user#sign_in'
  
  # get "user/register" => "users#register"
  # get 'user/register_new', to: 'user#register_new'
  # post 'user/register_new', to: 'user#create'
  #get 'user/register_newssss'

  get 'user/sign_out'

  get 'user/register_new'
  post 'user/register_new', to: 'user#create'

  get 'user/profile'

  # get 'user/edit'
  # post 'user/edit'

  get 'user/:id/edit', to: 'user#edit', as: 'user_edit'
  put 'user/:id', to: 'user#update'


  get 'user/user_login'

  get 'user/about'
  post 'user/about'

end