Rails.application.routes.draw do

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
namespace :admin do
  get 'orders/:order_id/order_details/:id' => 'order_details#update'
 end
 namespace :adimn do
  resources :orders, only: [:show, :update]
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
  get '/' => 'homes#top'
 end
 get '/' => 'homes#top'
 get '/about' => 'homes#about'
  resources :shippings, only: [:create, :edit, :index, :update, :destroy]
  resources :cart_items, only: [:index, :update, :destroy, :create]
 get 'cart_items/destoroy_all'
  resources :orders, only: [:new, :show, :index, :create]
 get 'orders/thank_you'
 get 'orders/confirm'
  resources :products, only: [:index, :show]
  resource :customers, only: [:edit, :update]
 get 'customers/my_page' => 'customers#show'
 get 'customers/unsubscribe'
 get 'customers/withdraw'




  #For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
