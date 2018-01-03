Rails.application.routes.draw do
  # For details on the DSL available within this file,
    # see http://guides.rubyonrails.org/routing.html
  resources 'admins'
  resources 'carts', only: [:show] do
    patch 'update_quantity'
  end
  resources 'orders' do
    patch 'checkout'
    patch 'add_address'
  end
  resources 'products' do
    patch 'add_to_cart'
    delete 'remove_from_cart'
    patch 'update_rating'
  end
  resources 'sessions', only: [:new, :create, :destroy]
  resources 'users'
  get 'welcome/index'
  root 'welcome#index'

end
