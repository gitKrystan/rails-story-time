class Story < ActiveRecord::Base
  has_many :sentences, dependent: :destroy
  accepts_nested_attributes_for :sentences
  validates :title, :presence => true
  validates :sentences, :presence => true

  def first_sentence
    sentences.first
  end

  def author
    first_sentence.author
  end

  def image
    first_sentence.image
  end
end
