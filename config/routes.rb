Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations'}
    resources :futurs
  resources :themes
  resources :decisions
    get 'choice/:id' => 'main#choice'
    get 'predictun/:theme/:id' => 'main#predictun'
    get 'predictdeux/:theme/:id' => 'main#predictdeux'
    get 'conclude/:theme/:id' => 'main#conclude'
    get 'submit' => 'main#submit'
    root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
