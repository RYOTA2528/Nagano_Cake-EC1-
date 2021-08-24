Rails.application.routes.draw do

devise_for :customers, skip: 'registrations', controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords'
}
devise_scope :customer do
    get '/customers/sign_up', to: 'public/registrations#new', as: :new_customer_registration
    post '/customers', to: 'public/registrations#create', as: :customer_registration
  end

devise_for :admins, path: "/admin", controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}




scope module: :public do
root to: 'homes#top'
get 'about', to: 'homes#about'

resource :customers, only: [:edit, :update]
get 'customers/my_page', to: 'customers#show'
get 'customers/unsubscribe', to: 'customers#unsubscribe'
patch 'customers/withdraw', to: 'customers#withdraw'
put 'customers/withdraw', to: 'customers#withdraw'

resources :addresses

resources :items, only: [:index, :show]
end



# devise_scope :admin do
#   get 'admin/sign_in' => 'admin/sessions#new'
#   post '/admin/sign_in' => 'admin/sessions#create'
#   delete  '/admin/sign_out' => 'admin/sessions#destroy'
# end

  namespace :admin do
    root to: 'homes#top'
    resources :items
    resources :genres
    resources :customers
   # 余裕あればgenresはonlyの指定を行う！

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
