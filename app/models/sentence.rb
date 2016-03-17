class Sentence < ActiveRecord::Base
  belongs_to :story
  belongs_to :image
  validates :author, presence: true
  validates :image, presence: true
  validates_length_of :content, :maximum => 300, :allow_blank => false
  validate :sentence_must_be_the_last_sentence, on: :update
  before_destroy :check_if_is_last_sentence_before_destroy

  def is_the_last_sentence?
    self == self.story.sentences.last
  end

  private

  def sentence_must_be_the_last_sentence
    if self.story && !self.is_the_last_sentence?
      errors.add(:base, 'Sentence must be the last sentence in the story.')
    end
  end

  def check_if_is_last_sentence_before_destroy
    return true if is_the_last_sentence? || destroyed_by_association
    errors.add :base, 'Cannot delete a sentence that is not the last sentence.'
    false
  end
end
