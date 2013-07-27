require 'spec_helper'

describe Hangman::Game do
  it 'marshals' do
    game = Hangman::Game.new
    game.guess 'a'

    unmarshaled_game = Marshal.load(Marshal.dump(game))

    expect(game).to eq(unmarshaled_game)
  end

  describe '#guesses' do
    it { expect(Hangman::Game.new.guesses).to be_empty }
  end

  describe '#guess' do
    context 'when the letter was already guessed' do
      it 'does not change the list of guesses' do
        game = Hangman::Game.new
        game.guess 'a'
        expect { game.guess 'a' }.to_not change { game.guesses }
      end
    end

    context 'when the letter was not already guessed' do
      it 'adds the letter to the list of guesses' do
        game = Hangman::Game.new
        game.guess 'a'
        expect(game.guesses).to include('a')
      end
    end
  end

  describe '#==' do
    it 'is true given another Hangman game with the same guesses' do
      game = Hangman::Game.new
      game.guess 'a'

      other_game = Hangman::Game.new
      other_game.guess 'a'

      expect(game).to eq(other_game)
    end

    it 'is false given another Hangman game with different guesses' do
      game = Hangman::Game.new
      game.guess 'a'

      other_game = Hangman::Game.new
      other_game.guess 'b'

      expect(game).to_not eq(other_game)
    end
  end
end