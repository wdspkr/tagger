class CreateFreeTags < ActiveRecord::Migration[5.1]
  def change
    create_table :free_tags do |t|
      t.references :record
      t.references :descriptive
      t.references :user

      t.timestamps
    end
  end
end
