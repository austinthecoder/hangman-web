require 'spec_helper'

describe Hangman do
  describe '.new_game' do
    it 'returns a new Hangman::Game' do
      expect(Hangman.new_game).to eq(Hangman::Game.new)
    end
  end
end