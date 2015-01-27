Rails.application.routes.draw do
    post '/login' => 'users#login'


    root :to => 'home#index'
end
