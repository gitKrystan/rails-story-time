class Sentence < ActiveRecord::Base
  belongs_to :story
  validates :author, presence: true
end
