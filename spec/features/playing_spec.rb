require 'spec_helper'

Capybara.exact = true

feature 'Playing the game' do
  scenario do
    Hangman.word_list = ['hangman']

    visit '/'

    click_on 'Start a new game'

    click_on 'e'

    page.should have_content "Guesses: e"
  end
end