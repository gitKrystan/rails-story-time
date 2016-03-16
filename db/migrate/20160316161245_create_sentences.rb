class CreateSentences < ActiveRecord::Migration
  def change
    create_table :sentences do |t|
      t.string :content
      t.string :author
      t.references :story, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
