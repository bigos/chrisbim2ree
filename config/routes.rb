Chrisbim2ree::Application.routes.draw do

  match "/empty_shopping_cart" => 'empty_shopping_cart#update'
  
  resources :newsletter_subscribers


  resources :cart_items


  resources :shopping_carts


  match 'contact' => 'contact_messages#new'
  resources :contact_messages

  get "bulk_upload/new"

  resources :tags do
    get :autocomplete_tag_category_name, :on => :collection
  end
  resources :tags

  resources :photos


  get "workshop_information/show"

  match "/photo_workshops/:duration/days" => 'workshops#index'
  resources :workshops


  match "about_me/:section" => 'about_me#index'

  resources :slides


  resources :password_resets, :only => [ :new, :create, :edit, :update ]
  
  resources :editables

  get "home_page/index"

  match '/activate/:activation_code' => 'activations#create'

  get "activations/create"

  resources :posts do
    resources :comments
  end

  match 'login' => 'user_sessions#new'
  match 'logout' => 'user_sessions#destroy'
  resource :user_session

  match 'register' => 'user#new'
  resource :account, :controller => "users"
  
  mount Ckeditor::Engine => '/ckeditor'
 

  root :to => 'home_page#index'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
