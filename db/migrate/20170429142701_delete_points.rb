class DeletePoints < ActiveRecord::Migration[5.0]
  def change
    drop_table :points
    create_table :upvotes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :review, index: true

      t.timestamps null: false
  end

    create_table :downvotes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :review, index: true

      t.timestamps null: false
    end
  end
end
