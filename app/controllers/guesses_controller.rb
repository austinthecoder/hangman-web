class GuessesController < ApplicationController
  def create
    game = fetch_current_game
    game.guess(params[:letter])
    save_game game
    redirect_to game_url
  end
end