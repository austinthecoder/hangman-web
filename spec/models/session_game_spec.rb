require 'spec_helper'

describe SessionGame do
  describe '.start' do
    it 'marshals a new game to the given session' do
      session = {}
      SessionGame.start(session)
      expect(session[:game]).to eq(Marshal.dump(Hangman.new_game))
    end
  end

  describe '.current' do
    it 'returns the unmarshaled session game from the given session' do
      session = {}
      SessionGame.start(session)
      expect(SessionGame.current(session)).to eq(Marshal.load(session[:game]))
    end
  end

  describe '.save' do
    it 'marshals the given game to the given session' do
      session = {}
      game = Hangman.new_game
      SessionGame.save(session, game)
      expect(session[:game]).to eq(Marshal.dump(game))
    end
  end
end