Rails.application.routes.draw do
  get 'user/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'user#index'

  get 'user/show'

  get 'user/about'
  post 'user/about', to: 'user#sign_in'

  get 'user/sign_out'

  get 'user/register_new'
  post 'user/register_new', to: 'user#create'

  get 'user/profile'

  get 'user/:id/edit', to: 'user#edit', as: 'user_edit'
  put 'user/:id', to: 'user#update'

  get 'user/user_login'

  get 'user/about'
  post 'user/about'

  get 'course/index'
  get 'course/new'
  post 'course/new', to: 'course#create'
  get 'course/show'

  get 'course/:id/edit', to: 'course#edit', as: 'course_edit'
  put 'course/:id', to: 'course#update'

  delete 'course/:id', to: 'course#destroy', as: 'course_delete'

end