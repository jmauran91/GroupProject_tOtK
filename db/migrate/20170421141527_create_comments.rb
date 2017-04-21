class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body, null: false
      t.belongs_to :review
      t.belongs_to :user

      t.timestamps
    end
  end
end
