Rails.application.routes.draw do

  get 'targets/new'
  get 'targets/index'
  get 'targets/show'
  get 'targets/edit'
  devise_for :users

  root to: "homes#top"

  resources :users, only:[:show,:edit,:update]

end
