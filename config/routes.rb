Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/workers' => 'workers#index'
  post '/workers' => 'workers#create'
  get '/workers/:id' => 'workers#show'
  patch '/workers/:id' => 'workers#update'
  delete '/workers/:id' => 'workers#delete'
end
