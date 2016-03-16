require "rails_helper"
require 'story_helper'

describe 'the add a new sentence path' do
  it 'adds a new sentence to an existing story' do
    test_story = create_test_story
    visit story_path(test_story)
    click_on 'Add a Sentence'
    fill_in 'Sentence', with: 'I am a new test sentence.'
    fill_in 'Author', with: 'New Test Author'
    click_on 'Create Sentence'
    expect(page).to have_content('I am a new test sentence.')
  end
end
