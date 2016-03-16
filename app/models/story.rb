class Story < ActiveRecord::Base
  has_many :sentences, dependent: :destroy
  accepts_nested_attributes_for :sentences
  validates :title, :presence => true
end
