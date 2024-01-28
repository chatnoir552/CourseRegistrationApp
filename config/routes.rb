Rails.application.routes.draw do
  get 'schedules/search'
  

  root to: "tasks#top"

  post "/users" => "users#create"

  post "/credit" => "credits#create"

  patch "/setting/update" => "users#update"
  patch "/users2/update" => "credits#update"
  patch "/getcredits/update" => "getcredits#update"
  patch "/bookmarks/:id" => "bookmarks#update"
 

  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  post "/bookmark" => "bookmarks#create"
  delete "/bookmarks/destroy/:id" => "bookmarks#destroy"
  delete "/schedule/searching/destroy/:id" => "schedules#unfollow"
  delete "/schedule/index/destroy/:id" => "schedules#index_unfollow"

  get "/bookmarks/take/:id" => "bookmarks#take"

  get "/getcredits" => "getcredits#new"

  get "/schedule/search" => "schedules#search"
  get "/schedule/searching" => "schedules#searching"
  get "/schedule/searching/:id" => "schedules#follow"
  get "/schedule/index/adjust/:id" => "schedules#adjust"
  get "/schedule/index" => "schedules#index"
  get "/schedule/table" => "schedules#table"
  

  get "/setting" => "users#setting"


  get "/bookmarks/new" => "bookmarks#new"
  get "/bookmarks" => "bookmarks#index"
  get "/bookmarks/:id/edit" => "bookmarks#setting"

  get "/login" => "sessions#new"


  get "/users" => "users#new"
  get "/users2" => "credits#new"


  
  get "/tasks" => "tasks#index"
end
