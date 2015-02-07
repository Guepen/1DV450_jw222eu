Rails.application.routes.draw do
    # Users
    post '/login' => 'users#login'
    get '/logout' => 'users#logout'
    get '/register' => 'users#register'
    post '/users/save' => 'users#create'

    # Apps
    get '/apps' => 'apps#index'
    get '/apps/create' => 'apps#create'
    get '/apps/delete/(:key)' => 'apps#delete'
    post '/apps/save' => 'apps#save'

    # API - Tags
    get '/api/tags' => 'tags#index'
    get '/api/tags/:id' => 'tags#single'

    root :to => 'home#index'
end
