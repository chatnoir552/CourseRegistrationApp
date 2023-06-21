Rails.application.routes.draw do

  root to: "tasks#top"

  post "/users" => "users#create"

  patch "/setting/update" => "users#update"

  post "/login" => "sessions#create"

  post "/bookmark" => "bookmarks#create"
  delete "/bookmarks/destroy/:id" => "bookmarks#destroy"

  get "/bookmarks/take/:id" => "bookmarks#take"


  delete "/logout" => "sessions#destroy"

  get "/setting" => "users#setting"


  get "/bookmarks/new" => "bookmarks#new"
  get "/bookmarks" => "bookmarks#index"

  get "/login" => "sessions#new"


  get "/users" => "users#new"
  get "/users2" => "users#new2"


  
  get "/tasks" => "tasks#index"
end
