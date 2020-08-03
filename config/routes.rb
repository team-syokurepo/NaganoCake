Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
root to: 'homes#top'
get "home/about" => "homes#about"
get "search" => "searches#search"


namespace :customers do
	resource :customers, only: [:show, :edit, :update, :destroy]
	get "customers/quit" => "customers#quit"
	delete "customers/quit_update" => "customers#quit_update"
	resources :orders, only: [:index, :show, :create, :new]
	get "orders/confirm" => "orders#confirm"
	get "orders/thanks" => "orders#thanks"
	resources :products, only: [:index, :show]
	resources :cart_products, only: [:index, :create, :update, :destroy]
	delete "cart_products/empty" => "cart_products#empty"
	resources :address_lists, only: [:index, :create, :edit, :update, :destroy]
end

namespace :admins do
	resources :orders, only: [:index, :show, :update]
	get "orders/today" => "orders#today"
	patch "orders/:id/product_update" => "orders#product_update"
	resources :products
	resources :categories, only: [:index, :create, :edit, :update]
	resources :customers, only: [:index, :show, :edit, :update]
end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
