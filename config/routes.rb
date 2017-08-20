Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/employee' => 'workers#index'
  get '/workers/:id' => 'workers#show'
end
