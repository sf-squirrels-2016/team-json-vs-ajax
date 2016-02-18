class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text    :title
      t.string  :type
      t.integer :user_id
      t.integer :post_id
      t.timestamps
    end
  end
end
