NintyNineCats::Application.routes.draw do
  resources :cats
  resources :cat_rental_requests do
    member do
      post 'approve'
      post 'deny'
    end
  end
  resources :users, :only => [:create, :new]
  resource :session, :only => [:create, :destroy, :new]

end
