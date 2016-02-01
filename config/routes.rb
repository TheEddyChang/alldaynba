Rails.application.routes.draw do

  root to: "games#index"

  get '/' => 'games#index'
  get '/team' => 'games#show' 
  get '/about' => 'games#about'
end
