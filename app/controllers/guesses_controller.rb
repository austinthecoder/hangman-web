class GuessesController < ApplicationController
  def create
    game = SessionGame.current(session)
    game.guess(params[:letter])
    SessionGame.save(session, game)
    redirect_to game_url
  end
end