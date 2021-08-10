Rails.application.routes.draw do


  scope module: :public do
  devise_for :customers
  end

  # scope module: :admin do
  # devise_for :admins
  # end

devise_for :admins
# controllers: {
#   sessions:      'admins/sessions',
#   passwords:     'admins/passwords',
#   registrations: 'admins/registrations'
# }
  namespace :admin do
  root to: 'homes#top'
  resources :items
  resources :genres
  # 余裕あればgenresはonlyの指定を行う！
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
