Rails.application.routes.draw do
  devise_for :users
    namespace :api do
        namespace :v1 do
            resources :users, only: [:show, :create, :update, :destroy] 
            resources :goals, only: [:create, :update, :destroy, :show, :index]
            resources :participation_trackers, only: [:create, :destroy, :show, :index] 
            resources :steps, only: [:update, :destroy, :show, :index]
            resources :sessions, only: [:create, :destroy]
            resources :goal_templates, :only => [:index, :show]
            resources :icons, :only => [:index]
        end
    end
end

