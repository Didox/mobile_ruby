ActionController::Routing::Routes.draw do |map|
  map.resources :groups
  map.add_pages_group 'adicionar_paginas/:id', :controller => 'groups', :action => 'add_pages'
  map.save_pages_group 'salvando_paginas/:id', :controller => 'groups', :action => 'save_pages'


  map.resources :full_banners
  map.add_pages_full_banner 'adicionar_paginas_full/:id', :controller => 'full_banners', :action => 'add_pages'
  map.save_pages_full_banner 'salvando_paginas_full/:id', :controller => 'full_banners', :action => 'save_pages'


  map.resources :popups
  map.add_pages_popup 'adicionar_paginas_pop/:id', :controller => 'popups', :action => 'add_pages'
  map.save_pages_popup 'salvando_paginas_pop/:id', :controller => 'popups', :action => 'save_pages'
  

  map.resources :users
  map.login 'logar', :controller => 'users', :action => 'login'
  map.logout 'sair', :controller => 'users', :action => 'logout'


  map.resources :pages
  map.add_groups_page 'adicionar_grupos/:id', :controller => 'pages', :action => 'add_groups'
  map.save_groups_page 'salvando_grupos/:id', :controller => 'pages', :action => 'save_groups'
  map.add_popups_page 'adicionar_popups/:id', :controller => 'pages', :action => 'add_popups'
  map.save_popups_page 'salvando_popups/:id', :controller => 'pages', :action => 'save_popups'
  map.add_full_banners_page 'adicionar_full_banners/:id', :controller => 'pages', :action => 'add_full_banners'
  map.save_full_banners_page 'salvando_full_banners/:id', :controller => 'pages', :action => 'save_full_banners'
  
  map.root :controller => "web"


  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
