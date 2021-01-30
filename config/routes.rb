Rails.application.routes.draw do
  resources :cities do
    get :autocomplete_city_name, :on => :collection
  end
  resources :clocks
  
  root 'clocks#index'
end
