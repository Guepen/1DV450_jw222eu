Rails.application.routes.draw do
    post '/login' => 'users#login'
    get '/logout' => 'users#logout'
    get '/register' => 'users#register'
    post '/users/save' => 'users#create'

    get '/apps' => 'apps#index'
    get '/apps/create' => 'apps#create'
    get '/apps/delete/(:key)' => 'apps#delete'
    post '/apps/save' => 'apps#save'

    root :to => 'home#index'
end
