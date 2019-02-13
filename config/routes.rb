# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "/api" do
    resources :leagues do
      resources :players, shallow: true
      resources :league_series, shallow: true # should accept series_events?
      resources :series_events, shallow: true # accepts event_players
      member do
        get :bootstrap
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
