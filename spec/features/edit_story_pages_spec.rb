require 'rails_helper'
require 'story_helper'

describe 'the edit a story path' do
  it 'allows a user to edit a story title' do
    create_test_story
    visit stories_path
    click_on 'Test Story'
    click_on 'Edit Story Title'
    fill_in 'Title', with: 'Updated Title'
    click_on 'Update Story'
    expect(page).to have_content 'Updated Title'
  end

  it 'gives an error when no information is entered' do
    story = create_test_story
    visit story_path(story)
    click_on 'Edit Story Title'
    fill_in 'Title', with: ''
    click_on 'Update Story'
    expect(page).to have_content 'errors'
  end
end
