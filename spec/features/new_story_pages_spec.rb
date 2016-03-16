require "rails_helper"

describe 'the new story process' do
  it 'adds a new story and its first sentence' do
    visit stories_path
    click_on 'New Story'
    fill_in 'Title', with: 'Test Story'
    fill_in 'Sentence', with: 'I am a test sentence.'
    fill_in 'Author', with: 'Test Author'
    click_on 'Create Story'
    expect(page).to have_content('Story successfully created.')
  end
end
