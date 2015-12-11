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
  get "/contacts/:id/content", :controller => "contacts", :action => "snip"
  get "/contacts/:id", :controller => "contacts", :action => "show"

  # UPDATE
  get "/contacts/:id/edit", :controller => "contacts", :action => "edit"
  post "/update_contact/:id", :controller => "contacts", :action => "update"

  # DELETE
  get "/delete_contact/:id", :controller => "contacts", :action => "destroy"
  #------------------------------
  # Dashboard page
  get "/dashboard", :controller => "dashboard", :action => "index"

  # User View
  get "/users", :controller => "users", :action => "index"
  post "/update_user/:id", :controller => "users", :action => "update"


  #Devise
  devise_for :users

  #Root
  root 'dashboard#index'

end
