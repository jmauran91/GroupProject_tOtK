class ReviewsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :body, null: false
      t.float :rating, null: false
      t.integer :votes, default: 0

      t.belongs_to :user
      t.belongs_to :release

      t.timestamps
    end
  end
end
