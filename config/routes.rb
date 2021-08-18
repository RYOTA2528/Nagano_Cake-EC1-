Rails.application.routes.draw do

devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
}
devise_for :admins, path: "/admin", controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}




scope module: :public do
root to: 'homes#top'
get 'about', to: 'homes#about'
get 'customers/my_page', to: 'customers#show'
get 'customers/edit', to: 'customers#edit'
patch 'customers', to: 'customers#update'
get 'customers/unsubscribe', to: 'customers#unsubscribe'
patch 'customers/withdraw', to: 'customers#withdraw'
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
