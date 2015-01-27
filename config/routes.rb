Rails.application.routes.draw do
    post '/login' => 'users#login'
    get '/logout' => 'users#logout'

    root :to => 'home#index'
end
