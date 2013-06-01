Bambah::Application.routes.draw do
  resources :orcamentos


  resources :lancamentos


  resources :naturezas


  resources :contas


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end