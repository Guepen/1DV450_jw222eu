Rails.application.routes.draw do
    # Users
    post '/login' => 'users#login'
    get '/logout' => 'users#logout'
    get '/register' => 'users#register'
    get '/users/settings' => 'users#settings'
    post '/users/save' => 'users#create'
    post '/users/update' => 'users#update'

    # Apps
    get '/apps' => 'apps#index'
    get '/apps/create' => 'apps#create'
    get '/apps/delete/(:key)' => 'apps#delete'
    post '/apps/save' => 'apps#save'

    # API - Tags
    get '/api/v1/tags' => 'tags#index'
    get '/api/v1/tags/:id' => 'tags#single'

    # API - Locations
    get '/api/v1/locations' => 'locations#index'
    get '/api/v1/locations:id' => 'locations#single'

    root :to => 'home#index'
end
