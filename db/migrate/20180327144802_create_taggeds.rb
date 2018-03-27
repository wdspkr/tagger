class CreateTaggeds < ActiveRecord::Migration[5.1]
  def change
    create_table :taggeds do |t|
      t.string :title
      t.string :creator
      t.string :url

      t.timestamps
    end
  end
end
