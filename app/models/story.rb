class Story < ActiveRecord::Base
  has_many :sentences
  validates :title, :presence => true
end
