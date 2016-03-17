require 'rails_helper'
require 'story_helper'

describe 'the edit a sentence path' do
  it 'allows a user to edit a sentence' do
    story = create_test_story
    sentence = story.first_sentence
    visit story_path(story)
    click_on "edit-sentence-#{sentence.id}"
    fill_in 'Sentence', with: 'I am an updated test sentence.'
    click_on 'Update Sentence'
    expect(page).not_to have_content('Test content.')
    expect(page).to have_content('I am an updated test sentence.')
  end

  it 'only allows the most recent sentence to be edited' do
    story = create_test_story
    first_sentence = story.first_sentence
    second_sentence = story.sentences.create(content: 'Second sentence.',
                                             author: 'Second author.',
                                             image: Image.random)
    visit story_path(story)
    expect(page).not_to have_selector "#edit-sentence-#{first_sentence.id}"
    visit edit_story_sentence_path(story, first_sentence)
    fill_in 'Sentence', with: 'I am an updated test sentence.'
    click_on 'Update Sentence'
    expect(page).to have_content('errors')
  end
end
