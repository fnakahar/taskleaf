Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # namespaceはコントローラを名前空間によってグループ化することができる。
  # どういうことかというと、ユーザーが使う部分とと管理者が使う部分をそれぞれ分けて管理できるようになる。
  # 管理者用のコントローラはcontrollers/adminディレクトリ以下に作成して管理するみたいに。
  namespace :admin do
    resources :users
  end

  root to: 'tasks#index'


  resources :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
