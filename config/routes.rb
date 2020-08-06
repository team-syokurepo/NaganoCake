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
	patch "customers/quit_update" => "customers#quit_update"
	resources :orders, only: [:index, :show, :create, :new]
	post "orders/confirm" => "orders#confirm"
	get "orders/thanks" => "orders#thanks"
	resources :products, only: [:index, :show] do
		resources :cart_products, only: [:create]
	end
	resources :cart_products, only: [:index, :update, :destroy]
	delete "cart_product/empty" => "cart_products#empty"
	resources :address_lists, only: [:index, :create, :edit, :update, :destroy]
end

namespace :admins do
	get "orders/today" => "orders#today"
	resources :orders, only: [:index, :show, :update]
	patch "orders/:order_id/product_orders/:id" => "orders#product_update",as:"product_order_update"
	resources :products
	resources :categories, only: [:index, :create, :edit, :update, :destroy]
	resources :customers, only: [:index, :show, :edit, :update]
end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
