Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#new"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", as: :signout

  resources :repositories do
    member do
      get :get_repo_commits
    end
  end
end
