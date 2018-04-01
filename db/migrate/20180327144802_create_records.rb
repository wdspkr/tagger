class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :title
      t.string :creator
      t.string :url
      t.references :user, index: true

      t.timestamps
    end
  end
end
