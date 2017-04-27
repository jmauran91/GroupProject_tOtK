class CreateReleaseGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :release_genres do |t|
      t.belongs_to :release, index: true
      t.belongs_to :genre, index: true

      t.timestamps null: false
    end
  end
end
