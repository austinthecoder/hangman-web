require 'spec_helper'

Capybara.exact = true

feature 'Playing the game' do
  scenario do
    Hangman.word_list = ['hangman']

    visit '/'

    click_on 'Start a new game'

    within '.word' do
      page.should have_content '_ _ _ _ _ _ _'
    end

    click_on 'e'

    page.should have_content "Guesses: e"
    within '.word' do
      page.should have_content '_ _ _ _ _ _ _'
    end

    click_on 'g'
    page.should have_content "Guesses: e, g"
    within '.word' do
      page.should have_content '_ _ _ g _ _ _'
    end

    click_on 'a'
    page.should have_content "Guesses: e, g, a"
    within '.word' do
      page.should have_content '_ a _ g _ a _'
    end

    click_on 'f'
    page.should have_content "Guesses: e, g, a, f"
    within '.word' do
      page.should have_content '_ a _ g _ a _'
    end

    click_on 'h'
    page.should have_content "Guesses: e, g, a, f, h"
    within '.word' do
      page.should have_content 'h a _ g _ a _'
    end

    click_on 'n'
    page.should have_content "Guesses: e, g, a, f, h, n"
    within '.word' do
      page.should have_content 'h a n g _ a n'
    end

    click_on 'm'
    page.should have_content "Guesses: e, g, a, f, h, n"
    within '.word' do
      page.should have_content 'h a n g m a n'
    end
  end
end