Rails.application.routes.draw do
  # For details on the DSL available within this file,
    # see http://guides.rubyonrails.org/routing.html
  resources 'admins'
  resources 'carts'
  resources 'products' do
    patch 'add_to_cart'
    delete 'remove_from_cart'
    patch 'update_rating'
  end
  resources 'sessions'
  resources 'users'
  get 'welcome/index'
  root 'welcome#index'

end
