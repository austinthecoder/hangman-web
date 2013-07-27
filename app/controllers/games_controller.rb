class GamesController < ApplicationController
  def create
    SessionGame.start(session)
    redirect_to game_url
  end

  def show
    @game = SessionGame.current(session)
  end
  attr_reader :game
  helper_method :game
end