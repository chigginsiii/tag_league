# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace "api" do
    namespace "v1" do
      resources :leagues, only: [:index, :show] do
        resources :players, shallow: true, only: [:index, :show]
        resources :league_series, shallow: true, only: [:index, :show] # should accept series_events?
        resources :series_events, shallow: true, only: [:index, :show] do
          post "signin"
        end
      end
    end
  end

  get "*path", to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
