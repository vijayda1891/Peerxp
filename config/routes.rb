Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'projects#index'

  # routes for project controller

  get '/add_project', to: 'projects#new', as: :add_project
  get '/edit_project/:id', to: 'projects#edit', as: :edit_project
  post '/create_project', to: 'projects#create', as: :create_project
  post '/update_project', to: 'projects#update', as: :update_project
  delete '/delete_project', to: 'projects#destroy', as: :delete_project

  # routes for tasks
  get '/get_tasks', to: 'tasks#index', as: :get_tasks
  get '/edit_task', to: 'tasks#edit', as: :edit_tasks
  get '/tasks/:id/toggle_status', to: 'tasks#toggle_status', as: :toggle_status
  post '/create_task', to: 'tasks#create_task', as: :create_task
  post '/update_task', to: 'tasks#update', as: :update_task
  delete '/delete_task', to: 'tasks#destroy', as: :delete_task

  # routes for comments
  get '/add_comment', to: 'comments#new', as: :add_comment
  post '/create_comment', to: 'comments#create', as: :create_comment
  delete '/delete_comment', to: 'comments#destroy', as: :delete_comment

end
