class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :level
      t.text :notes

      t.timestamps
    end
  end
end
