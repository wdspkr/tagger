class CreateDescriptives < ActiveRecord::Migration[5.1]
  def change
    create_table :descriptives do |t|
      t.string :term

      t.timestamps
    end
  end
end
