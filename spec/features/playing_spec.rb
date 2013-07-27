require 'spec_helper'

Capybara.exact = true

feature 'Playing the game' do
  before do
    Hangman.word_list = ['hangman']

    visit '/'
    click_on 'Start a new game'
  end

  scenario 'winning game' do
    page.should have_content "Guesses left: 7"
    word_should_be '_ _ _ _ _ _ _'

    click_on 'e'

    page.should have_content "Guesses: e"
    page.should have_content "Guesses left: 6"
    word_should_be '_ _ _ _ _ _ _'

    click_on 'g'

    page.should have_content "Guesses: e, g"
    page.should have_content "Guesses left: 6"
    word_should_be '_ _ _ g _ _ _'

    click_on 'a'

    page.should have_content "Guesses: e, g, a"
    page.should have_content "Guesses left: 6"
    word_should_be '_ a _ g _ a _'

    click_on 'f'

    page.should have_content "Guesses: e, g, a, f"
    page.should have_content "Guesses left: 5"
    word_should_be '_ a _ g _ a _'

    click_on 'h'

    page.should have_content "Guesses: e, g, a, f, h"
    page.should have_content "Guesses left: 5"
    word_should_be 'h a _ g _ a _'

    click_on 'n'

    page.should have_content "Guesses: e, g, a, f, h, n"
    page.should have_content "Guesses left: 5"
    word_should_be 'h a n g _ a n'

    click_on 'm'

    page.should have_content "Guesses: e, g, a, f, h, n"
    page.should have_content "Guesses left: 5"
    word_should_be 'h a n g m a n'

    page.should have_content 'You win!'
  end

  scenario 'losing game' do
    %w[x y z q f k h a n g l].each { |l| click_on l }
    page.should have_content 'You lose!'
  end

  def word_should_be(word)
    within('#word') { page.should have_content word }
  end
end