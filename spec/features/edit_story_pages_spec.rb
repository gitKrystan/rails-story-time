require 'rails_helper'
require 'story_helper'

describe 'the edit a story path' do
  it 'allows a user to edit a story title' do
    create_test_story
    visit stories_path
    click_on 'Test Story'
    click_on 'Edit Story Prompt'
    fill_in 'Title', with: 'Updated Title'
    click_on 'Update Story'
    expect(page).to have_content 'Updated Title'
  end
end
