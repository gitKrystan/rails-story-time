require "rails_helper"
require 'story_helper'

describe 'the add a new sentence path' do
  before do
    test_story = create_test_story
    visit story_path(test_story)
    click_link 'add-sentence'
  end

  it 'adds a new sentence to an existing story' do
    expect(page).to have_content('Your sentence should be inspired by the image at the left.')
    fill_in 'sentence_content', with: 'I am a new test sentence.'
    fill_in 'Author', with: 'New Test Author'
    click_on 'submit-sentence'
    expect(page).to have_content('I am a new test sentence.')
    expect(page).to have_css('.sentence-image')
  end

  it 'gives an error if the sentence is blank' do
    click_on 'submit-sentence'
    expect(page).to have_content('errors')
  end
end
