class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.string :like_artist
      t.string :img
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
