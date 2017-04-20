class CreateReleases < ActiveRecord::Migration[5.0]
  def change
    create_table :releases do |t|
      t.string :title, null: false
      t.string :artist, null: false
      t.string :performer
      t.integer :year, null: false
      t.string :studio
      t.integer :no_of_tracks, null: false
      t.string :album_art_url, null: false
      t.string :description

      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
