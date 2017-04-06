Rails.application.routes.draw do
  resources :users
  resources :pages
      root :to => 'welcomes#home'
end
