class GamesController < ApplicationController
  def create
    start_game!
    redirect_to game_url
  end

  def show
    @game = fetch_current_game
  end
  attr_reader :game
  helper_method :game
end