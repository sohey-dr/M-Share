class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :share, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :share_id], unique: true
    end
  end
end
