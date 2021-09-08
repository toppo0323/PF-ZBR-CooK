Rails.application.routes.draw do


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}
devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}


#管理者側ルーティング

namespace :admin do
 resources :recipes,only:[:index,:show,:edit,:update,:destroy]
 resources :genres,only:[:index,:create,:edit,:update]
 resources :customers,only:[:index,:show,:edit,:update]
end



#会員側ルーティング

scope module: :public do

    root 'homes#top'
    get 'about' => 'homes#about'
    get '/search' => 'searches#search'
    get '/rank' => 'recipes#rank'
    resources :customers,only:[:show,:edit,:update]

    resources :recipes do
        resources :comments,only: [:create, :destroy]
        resource :likes, only: [:create, :destroy]
        get :search, on: :collection

    end
end




end