Rails.application.routes.draw do
  get 'android/feeds' => 'feeds#index'

  post 'android/create_live' => 'android_live#create'
  delete 'android/live/:movie_id' => 'android_live#delete'

  resources :rooms
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
