Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "contacts#index"
  get "/contacts", to: 'contacts#index'
  get "/contacts/new", to: 'contacts#new'
  get "/contacts/:id", to: 'contacts#show'
  post "/contacts", to: 'contacts#create'
  get "/contacts/:id/edit", to: 'contacts#edit'
  patch "/contacts/:id", to: 'contacts#update'
  delete "/contacts/:id", to: 'contacts#destroy'
  get "/all_johns", to: 'contacts#all_johns'
end
