Rails.application.routes.draw do
  devise_for :users
    resources :futurs
  resources :themes
  resources :decisions
    get 'choice/:id' => 'main#choice'
    root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
