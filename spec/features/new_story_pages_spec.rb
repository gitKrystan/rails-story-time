require "rails_helper"

describe 'the new story process' do
  it 'adds a new story and its first sentence' do
    visit stories_path
    click_on 'New Story'
    expect(page).to have_css('.story-image')
    fill_in 'Title', with: 'Test Story'
    fill_in 'Sentence', with: 'I am a test sentence.'
    fill_in 'Author', with: 'Test Author'
    click_on 'Create Story'
    expect(page).to have_content('Story successfully created.')
    expect(page).to have_css('.sentence-image')
  end

  it 'gives an error when no information is entered' do
    visit new_story_path
    click_on 'Create Story'
    expect(page).to have_content 'errors'
  end
end
