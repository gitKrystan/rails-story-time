class Story < ActiveRecord::Base
  validates :title, :presence => true
end
