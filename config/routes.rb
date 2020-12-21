# frozen_string_literal: true

Rails.application.routes.draw do
  resources :low_voltage_segments
  resources :low_voltage_consumption_units
  resources :substation_transformer_units
  resources :substations
  resources :medium_voltage_segments
  resources :medium_voltage_circuits
  resources :buses
  resources :notable_points
  resources :static_pages

  resources :groups, only: [:index, :show] do
    resources :entities, only: [:index, :show]
  end
end
