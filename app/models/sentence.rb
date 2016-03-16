class Sentence < ActiveRecord::Base
  belongs_to :story
  validates :author, presence: true
  validates_length_of :content, :maximum => 300, :allow_blank => false
  validate :sentence_must_be_the_last_sentence, on: :update

  private

  def sentence_must_be_the_last_sentence
    if self.story && (self != self.story.sentences.last)
      errors.add(:story, ': Sentence must be the last sentence in the story.')
    end
  end
end
