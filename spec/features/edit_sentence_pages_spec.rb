require 'rails_helper'
require 'story_helper'

describe 'the edit a sentence path' do
  it 'allows a user to edit a sentence' do
    story = create_test_story
    visit story_path(story)
    click_on 'Edit'
    fill_in 'Sentence', with: 'I am an updated test sentence.'
    click_on 'Update Sentence'
    expect(page).not_to have_content('Test content.')
    expect(page).to have_content('I am an updated test sentence.')
  end
end
