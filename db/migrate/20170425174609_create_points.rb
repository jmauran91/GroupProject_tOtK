class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.belongs_to :user
      t.belongs_to :review
      t.boolean :upvote, default: false
      t.boolean :downvote, default: false

      t.timestamps
    end
  end
end
