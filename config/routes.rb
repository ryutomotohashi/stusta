Rails.application.routes.draw do

  devise_for :users

  root to: "homes#top"
  # STUDY STARTpage
  get "start" => "homes#start", as: "start"

  resources :users, only:[:show,:edit,:update, :index] do
    resource :relationships, only:[:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
  end

  resources :targets, only:[:new,:create,:show,:edit,:update,:index, :destroy] do
    resources :target_comments, only:[:create,:destroy]
    resource :favorites, only:[:create,:destroy]
  end

end
