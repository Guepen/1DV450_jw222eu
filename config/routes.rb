Rails.application.routes.draw do
    post '/login' => 'users#login'
    get '/logout' => 'users#logout'
    get '/register' => 'users#register'
    post '/create' => 'users#create'

    get '/apps' => 'apps#index'
    get '/apps/create' => 'apps#create'
    get '/apps/delete/(:key)' => 'apps#delete'

    root :to => 'home#index'
end
