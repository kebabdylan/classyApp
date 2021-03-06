ClassyApp::Application.routes.draw do


  match  "/authenticate" => 'session#authenticate'
  get "/login" => 'session#prompt'
  get "/logout" => 'session#logout'
  match "/seats/generate" => 'seats#generate'
  match "/seats/clear" => 'seats#clear'

  match "/seats/:id/assign/:student_id" => 'seats#assign'
  match "/seats/:id/unassign" => 'seats#unassign'

  match "/batch/grades" => "batch#grades",:as => :import_grades
  match "/batch/apply" => 'batch#apply', :as => :process_grades

  resources :seats
  resources :classrooms
  resources :users
  resources :majors
  resources :members
  resources :teams
  resources :classifications

  get "students/chart"   => "students#chart", :as => :student_chart
  get "students/chart/assign"   => "students#assign_chart", :as => :student_assign_chart
  get "students/list"   => "students#list", :as => :student_list
  get "/batch/index", :as => :new_batch
  get "/batch/svn", :as => :svn
  get "/batch" => 'batch#index'
  post "/batch/import", :as => :process_batch
  post "/teams/addMember" => 'teams#addMember'
  get "/batch/clear"

  resources :students do
    resources :notes
  end
  
  resources :semesters
  resources :sections
  resources :courses
  match '/students/:id/svn' => 'students#svn', :as => :student_svn
  root  :to => 'students#index'

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
