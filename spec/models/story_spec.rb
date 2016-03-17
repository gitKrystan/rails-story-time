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
end
