class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :genre
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
