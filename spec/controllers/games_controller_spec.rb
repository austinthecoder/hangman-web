require 'spec_helper'

describe GamesController do
  describe 'POST create' do
    it 'starts a session game' do
      controller.should_receive(:start_game!)
      post :create
    end

    it 'redirects to the game page' do
      post :create
      expect { response }.to redirect_to(game_url)
    end
  end

  describe 'GET show' do
    it 'assigns the current game' do
      game = double 'game'
      controller.stub(:fetch_current_game) { game }
      get :show
      assigns(:game).should eq(game)
    end
  end
end