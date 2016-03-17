require "rails_helper"
require "story_helper"

describe Sentence do
  it { should belong_to :story }
  it { should belong_to :image }
  it { should validate_presence_of :author }
  it { should validate_length_of :content }

  context '#destroy' do
    it 'will only directly destroy the last sentence' do
      story = create_test_story
      first_sentence = story.sentences.first
      second_sentence = story.sentences.create(content: 'Second sentence.',
                                               author: 'Second author.')
      expect(first_sentence.destroy).to be false
    end
  end
end
