Rails.application.routes.draw do
  resources :users #, only: [:index, :new, :create, :show, :edit]
  resources :orders
  resources :order_details
  resources :pages
  resource :sessions, only: [:new, :create, :destroy]
  # Establish a nested route with product_images inside of products
  resources :products do 
    resources :product_images 
  end

  root 'pages#home'

# get 'pages/home'

#  get 'sessions/new'

#  get 'orders/index'

#  get 'orders/new'

#  get 'orders/show'

#  get 'orders/edit'

#  get 'product_images/index'

#  get 'product_images/new'

#  get 'product_images/show'

#  get 'product_images/edit'

#  get 'products/index'

#  get 'products/new'

#  get 'products/show'

#  get 'products/edit'

#  get 'order_details/new'

#  get 'order_details/show'

#  get 'order_details/edit'

#  get 'categories/new'

#  get 'categories/show'

#  get 'categories/edit'

#  get 'users/index'

#  get 'users/new'

#  get 'users/show'

#  get 'users/edit'

  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
