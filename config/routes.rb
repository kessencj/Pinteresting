Rails.application.routes.draw do

 

  # devise_for :users
  root "pages#home"
  get "about" => "pages#about" # creates about_path
  get "tunes" => "pages#tunes" # creates tunes_path
  get "photographs" => "pages#photographs" # creates photographs_path
  get "dates" => "pages#dates" # creates dates_path
  get "blog_posts/new" => "blog_posts#new" #creates route in address bar to lead to the blog creation page
  post "create" => "blog_posts#create" #creates new route for the database
  get "blog_posts/index" => "blog_posts#index", :as => 'blog_index'
  get "blog_posts/edit/:id" => "blog_posts#edit", :as => 'edit_blog_post' #creates route to edit blogposts
  get "blog_posts/:id" => "blog_posts#show", :as => 'blog_post' #Creates a route to the show page that is equal to the blogpost with id number
  delete "blog_posts/:id" => "blog_posts#destroy" #creates delete path

 resources :blog_posts do
    resources :comments
  end

  # resources :blog_posts

  # match "about/:code", :to => "pages#about", :as => "about"

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
