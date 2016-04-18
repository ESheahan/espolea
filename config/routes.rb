Rails.application.routes.draw do
  resources :schedules
  devise_for :users
  get 'pages/show'
  get '/language/es', to: "application#set_english", as: 'set_english'
  get '/language/en', to: "application#set_spanish", as: 'set_spanish'
  get '/schedule/new/:clinic_id', to: "schedules#new"
  get '/login', to: 'users#sign_in', as: 'login'
  post '/signin', to: 'users#sign_in', as: 'signin'
  get '/register', to: 'users#sign_up', as: 'register'
  post '/register', to: 'users#confirm_registration', as: 'confirm_registration'
  
  get '/clinics/confirm/:id', to: 'clinics#confirm'

  get '/profile/:id', to: 'users#show', as: 'profile'
  get '/profile', to: 'users#index', as: 'profiles'

  get '/find', to: 'schedules#index', as: 'find'
  post '/search_appointments', to: 'schedules#find', as: 'search_appointments'

  get '/review/new/:clinic_id', to: 'reviews#new', as: 'new_clinic_review'
  resources :reviews
  resources :clinics
  root "pages#show", page: "home"
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
