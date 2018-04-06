class CreateScales < ActiveRecord::Migration[5.1]
  def change
    create_table :scales do |t|
      t.string :left
      t.string :right

      t.timestamps
    end
  end
end
