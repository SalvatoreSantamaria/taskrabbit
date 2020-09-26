Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tasks #creats all the routes for tasks (like tasks #index, tasks/new #new, tasks/id/edit #edit, task/id #show, etc)
  root 'tasks#index' #make root, make sure index is defined in task controller
  resources :tests
end
