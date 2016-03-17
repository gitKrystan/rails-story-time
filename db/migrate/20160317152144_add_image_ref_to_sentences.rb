class AddImageRefToSentences < ActiveRecord::Migration
  def change
    add_reference :sentences, :image, index: true, foreign_key: true
  end
end
