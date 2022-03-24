Rails.application.routes.draw do

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 devise_for :admin, controllers: {
  sessions: 'admin/sessions'
 }

#devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  #sessions: "admin/sessions"
#}



 namespace :admin do

  resources :orders, only: [:show, :update] 
  
  resources :order_details,only: [:update]
 end
 namespace :admin do
  resources :customers, only: [:show, :index, :edit, :update]
 end
 namespace :admin do
  resources :genres, only: [:create, :index, :edit, :update]
 end
 namespace :admin do
  resources :products, only: [:new, :create, :show, :index, :edit, :update]
 end
 namespace :admin do
  get '/' => 'homes#top', as: 'top'
 end

 scope module: :public do
 root to: 'homes#top'
 get '/about' => 'homes#about'
 resources :shippings, only: [:create, :edit, :index, :update, :destroy]
 delete 'cart_items/destroy_all'
 resources :cart_items, only: [:index, :update, :destroy, :create]
 get 'orders/thank_you'
 post 'orders/confirm'
 resources :orders, only: [:new, :show, :index, :create]
 resources :products, only: [:index, :show]
 resource :customers, only: [:edit, :update], path: "customers/my_page"
 get 'customers/my_page' => 'customers#show'
 get 'customers/unsubscribe'
 get 'customers/withdraw'

 patch 'customers/withdraw'
 end

  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
