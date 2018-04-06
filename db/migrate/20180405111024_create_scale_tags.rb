class CreateScaleTags < ActiveRecord::Migration[5.1]
  def change
    create_table :scale_tags do |t|
      t.references :record
      t.references :scale
      t.references :user
      t.float      :value

      t.timestamps
    end
  end
end
