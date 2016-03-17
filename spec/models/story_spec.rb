require "rails_helper"
require "story_helper"

describe Story do
  it { should have_many(:sentences).dependent :destroy }
  it { should accept_nested_attributes_for :sentences }
  it { should validate_presence_of :title }

  context '#destroy' do
    it 'will delete all of its sentences' do
      story = create_test_story
      first_sentence = story.sentences.first
      second_sentence = story.sentences.create(content: 'Second sentence.',
                                               author: 'Second author.')
      expect(story.destroy).to be_truthy
    end
  end

  context '.first_sentence' do
    it 'will return the first sentence of the story' do
      story = create_test_story
      first_sentence = story.sentences.first
      expect(story.first_sentence).to eq(first_sentence)
    end
  end

  context '.author' do
    it 'will return the author of the first sentence of the story' do
      story = create_test_story
      first_sentence = story.sentences.first
      expect(story.author).to eq(first_sentence.author)
    end
  end

  context '.image' do
    it 'will return the image of the first sentence of the story' do
      story = create_test_story
      first_sentence = story.sentences.first
      expect(story.image).to eq(first_sentence.image)
    end
  end
end
