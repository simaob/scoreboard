class RemoveUserIdFromVotes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :votes, :user, null: false, foreign_key: true
  end
end
