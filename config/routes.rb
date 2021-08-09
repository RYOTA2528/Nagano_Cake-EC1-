Rails.application.routes.draw do

  devise_for :admins
  namespace :admin do
  root to: 'homes#top'
  resources :items 
  resources :genres
  # 余裕あればgenresはonlyの指定を行う！
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
