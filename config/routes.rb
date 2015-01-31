Rails.application.routes.draw do
    post '/login' => 'users#login'
    get '/logout' => 'users#logout'
    get '/register' => 'users#register'
    post '/create' => 'users#create'

    get '/keys' => 'keys#index'
    get '/keys/delete' => 'keys#delete'

    root :to => 'home#index'
end
