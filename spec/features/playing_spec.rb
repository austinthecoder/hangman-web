require 'spec_helper'

Capybara.exact = true

feature 'Playing the game' do
  before do
    Hangman.word_list = ['hangman']

    visit '/'
    click_on 'Start a new game'
  end

  scenario 'winning game' do
    guesses_left_should_be 6
    word_should_be '_ _ _ _ _ _ _'

    click_on 'e'

    guesses_should_be 'e'
    guesses_left_should_be 5
    word_should_be '_ _ _ _ _ _ _'

    click_on 'g'

    guesses_should_be 'e', 'g'
    guesses_left_should_be 5
    word_should_be '_ _ _ g _ _ _'

    click_on 'a'

    guesses_should_be 'e', 'g', 'a'
    guesses_left_should_be 5
    word_should_be '_ a _ g _ a _'

    click_on 'f'

    guesses_should_be 'e', 'g', 'a', 'f'
    guesses_left_should_be 4
    word_should_be '_ a _ g _ a _'

    click_on 'h'

    guesses_should_be 'e', 'g', 'a', 'f', 'h'
    guesses_left_should_be 4
    word_should_be 'h a _ g _ a _'

    click_on 'n'

    guesses_should_be 'e', 'g', 'a', 'f', 'h', 'n'
    guesses_left_should_be 4
    word_should_be 'h a n g _ a n'

    click_on 'm'

    page.should have_content 'You win!'
  end

  scenario 'losing game' do
    %w[x y z q f h a n g l].each { |l| click_on l }
    page.should have_content 'You lose!'
  end

  def word_should_be(word)
    within('#word') { page.should have_content word }
  end

  def guesses_should_be(*letters)
    letters.each do |letter|
      page.find 'strike', :text => letter
    end
  end

  def guesses_left_should_be(num)
    expect { find(%{img[alt="#{num} guesses left"]}) }.to_not raise_error(Capybara::ElementNotFound)
  end
end