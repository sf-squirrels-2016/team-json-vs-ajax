class CreateVotesTable < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    t.integer :user_id, :null => false
    t.integer :vote_value, :null => false
    t.integer :votable_id, :null => false
    t.string :votable_type, :null => false
    t.timestamps
    end
  end
end
