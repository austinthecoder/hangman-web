class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def start_game!
    session[:game] = Marshal.dump(Hangman.new_game)
  end

  def fetch_current_game
    Marshal.load session[:game]
  end

  def save_game(game)
    session[:game] = Marshal.dump(game)
  end
end
