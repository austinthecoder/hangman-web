require 'spec_helper'

describe GuessesController do
  describe 'POST create' do
    context 'when a game has been started' do
      before do
        SessionGame.start(session)
        @game = Hangman.new_game
        SessionGame.stub(:current).with(session) { @game }
      end

      it 'makes a guess for the game' do
        @game.should_receive(:guess).with('A')
        post :create, :letter => 'A'
      end

      it 'saves the game' do
        SessionGame.should_receive(:save).with(session, @game)
        post :create, :letter => 'A'
      end

      it 'redirects to the game page' do
        post :create, :letter => 'A'
        response.should redirect_to game_url
      end
    end

    context 'when a game has not been started' do
      it 'raises an error' do
        expect { post :create, :letter => 'A' }.to raise_error
      end
    end
  end
end