class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :music_name
      t.string :artist_name
      t.string :img
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
