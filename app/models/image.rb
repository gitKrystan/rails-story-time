class Image < ActiveRecord::Base
  has_many :sentences

  def self.random
    offset = rand(Image.count)
    Image.offset(offset).first
  end
end
