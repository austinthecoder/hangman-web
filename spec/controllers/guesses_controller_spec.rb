require 'spec_helper'

describe GuessesController do
  describe 'POST create' do
    context 'when a game has been started' do
      before do
        controller.start_game!
      end

      it 'makes a guess for the current game' do
        game = double 'game'
        controller.stub(:fetch_current_game) { game }
        game.should_receive(:guess).with('a')
        post :create, :letter => 'a'
      end

      it 'saves the game' do
        controller.should_receive(:save_game).with(an_instance_of(Hangman::Game))
        post :create, :letter => 'a'
      end

      it 'redirects to the game page' do
        post :create, :letter => 'a'
        response.should redirect_to game_url
      end
    end

    context 'when a game has not been started' do
      it 'raises an error' do
        expect { post :create, :letter => 'a' }.to raise_error
      end
    end
  end
end