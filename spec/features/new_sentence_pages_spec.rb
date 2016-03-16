require "rails_helper"
require 'story_helper'

describe 'the add a new sentence path' do
  before do
    test_story = create_test_story
    visit story_path(test_story)
    click_on 'Add a Sentence'
  end

  it 'adds a new sentence to an existing story' do
    fill_in 'Sentence', with: 'I am a new test sentence.'
    fill_in 'Author', with: 'New Test Author'
    click_on 'Create Sentence'
    expect(page).to have_content('I am a new test sentence.')
  end

  it 'gives an error if the sentence is blank' do
    click_on 'Create Sentence'
    expect(page).to have_content('errors')
  end
end
