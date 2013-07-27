require 'spec_helper'

describe ApplicationController do
  describe '#start_game!' do
    it 'adds a new game to the session' do
      controller.start_game!
      expect(session[:game]).to eq Marshal.dump(Hangman.new_game)
    end
  end

  describe '#fetch_current_game' do
    it 'returns the game in the session' do
      game = Hangman.new_game
      game.guess 'a'
      session[:game] = Marshal.dump(game)
      expect(controller.fetch_current_game).to eq game
    end
  end

  describe '#save_game' do
    it 'marshals the given game to the session' do
      game = Hangman.new_game
      controller.save_game(game)
      expect(session[:game]).to eq Marshal.dump(game)
    end
  end
end