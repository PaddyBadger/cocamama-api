require 'api_constraints'

Rails.application.routes.draw do
  mount SabisuRails::Engine => "/sabisu_rails"
  devise_for :users
    namespace :api, defaults: { format: :json },
                                constraints: { subdomain: 'api' }, path: '/' do
        scope module: :v1,
            constraints: ApiConstraints.new(version: 1, default: true) do
                resources :users, only: [:show, :create, :update, :destroy] 
                resources :goals, only: [:create, :update, :destroy] 
                resources :participation_trackers, only: [:update, :create, :destroy] 
                resources :steps, only: [:update, :create, :destroy]
                
                resources :sessions, only: [:create, :destroy]
                resources :goals, only: [:show, :index]
                resources :participation_trackers, only: [:show, :index] 
                resources :steps, only: [:show, :index]
                resources :goal_templates, :only => [:index, :show]
            end
    end
end

