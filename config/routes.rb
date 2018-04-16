Rails.application.routes.draw do
  get 'reservedslots/show'

  get 'reservedslots/new'

  get 'reservedslots/create'

  get 'reservedslots/destroy'

  get 'timeslots/show'

  get 'timeslots/new'

  get 'timeslots/create'

  get 'timeslots/destroy'

  get 'positions/show'

  get 'positions/new'

  get 'positions/create'

  get 'positions/destroy'

  get 'welcome/index'

  root 'home#index'

  #get '/employees/:id' => 'employees#show'
  resources :jobs do
    resources :timeslots
  end
  resources :employees
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
