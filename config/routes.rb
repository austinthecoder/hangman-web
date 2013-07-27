HangmanWeb::Application.routes.draw do
  root :to => 'pages#home'

  resource :game, :only => [:create, :show] do
    resources :guesses, :only => [:create]
  end
end
