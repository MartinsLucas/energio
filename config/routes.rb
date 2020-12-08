Rails.application.routes.draw do
  resources :low_voltage_segments
  resources :low_voltage_consumption_units
  resources :substation_transformer_units
  resources :substations
  resources :medium_voltage_segments
  resources :groups
  resources :medium_voltage_circuits
  resources :buses
  resources :notable_points
  resources :static_pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
