Rails.application.routes.draw do
  # Routes for the Move resource:
  # CREATE
  get "/moves/new", :controller => "moves", :action => "new"
  post "/create_move", :controller => "moves", :action => "create"

  # READ
  get "/moves", :controller => "moves", :action => "index"
  get "/moves/:id", :controller => "moves", :action => "show"

  # UPDATE
  get "/moves/:id/edit", :controller => "moves", :action => "edit"
  post "/update_move/:id", :controller => "moves", :action => "update"

  # DELETE
  get "/delete_move/:id", :controller => "moves", :action => "destroy"
  #------------------------------

  # Routes for the Stale_listing resource:
  # CREATE
  get "/stale_listings/new", :controller => "stale_listings", :action => "new"
  post "/create_stale_listing", :controller => "stale_listings", :action => "create"

  # READ
  get "/stale_listings", :controller => "stale_listings", :action => "index"
  get "/stale_listings/:id", :controller => "stale_listings", :action => "show"

  # UPDATE
  get "/stale_listings/:id/edit", :controller => "stale_listings", :action => "edit"
  post "/update_stale_listing/:id", :controller => "stale_listings", :action => "update"

  # DELETE
  get "/delete_stale_listing/:id", :controller => "stale_listings", :action => "destroy"
  #------------------------------

  # Routes for the Change resource:
  # CREATE
  get "/changes/new", :controller => "changes", :action => "new"
  post "/create_change", :controller => "changes", :action => "create"

  # READ
  get "/changes", :controller => "changes", :action => "index"
  get "/changes/:id", :controller => "changes", :action => "show"

  # UPDATE
  get "/changes/:id/edit", :controller => "changes", :action => "edit"
  post "/update_change/:id", :controller => "changes", :action => "update"

  # DELETE
  get "/delete_change/:id", :controller => "changes", :action => "destroy"
  #------------------------------

  # Routes for the Contact resource:
  # CREATE
  get "/contacts/new", :controller => "contacts", :action => "new"
  post "/create_contact", :controller => "contacts", :action => "create"

  # READ
  get "/contacts", :controller => "contacts", :action => "index"
  get "/contacts/:id", :controller => "contacts", :action => "show"

  # UPDATE
  get "/contacts/:id/edit", :controller => "contacts", :action => "edit"
  post "/update_contact/:id", :controller => "contacts", :action => "update"

  # DELETE
  get "/delete_contact/:id", :controller => "contacts", :action => "destroy"
  #------------------------------

  devise_for :users
  root 'contacts#index'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
