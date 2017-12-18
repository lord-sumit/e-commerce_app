Rails.application.routes.draw do
  # For details on the DSL available within this file,
    # see http://guides.rubyonrails.org/routing.html
  get 'welcome/index'
  root 'welcome#index'
  resources 'users'
  resources 'sessions'
  resources 'products' do
    get 'add_to_cart'
    delete 'remove_from_cart'
  end
  resources 'carts'
end
