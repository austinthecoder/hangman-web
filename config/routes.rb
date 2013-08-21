HangmanWeb::Application.routes.draw do
  root :to => 'pages#home'

  resource :game, :only => [:create, :show] do
    resources :guesses, :only => [:create]
    get 'guesses', :to => 'guesses#create'
  end
end
