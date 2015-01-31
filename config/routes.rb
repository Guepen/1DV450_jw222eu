Rails.application.routes.draw do
    post '/login' => 'users#login'
    get '/logout' => 'users#logout'
    get '/register' => 'users#register'
    post '/create' => 'users#create'

    get '/keys' => 'keys#index'
    get '/keys/create/' => 'keys#create'
    get '/keys/delete/(:key)' => 'keys#delete'

    root :to => 'home#index'
end
