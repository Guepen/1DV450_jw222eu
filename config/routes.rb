Rails.application.routes.draw do
    post '/login' => 'users#login'
    get '/logout' => 'users#logout'

    get '/keys' => 'keys#index'

    root :to => 'home#index'
end
