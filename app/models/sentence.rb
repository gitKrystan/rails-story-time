class Sentence < ActiveRecord::Base
  belongs_to :story
  validates :author, presence: true
  validates_length_of :content, :maximum => 300, :allow_blank => false
end
