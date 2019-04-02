class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.string :title
      t.string :body

      t.timestamps null: false
    end
    add_foreign_key :posts, :users
  end
end