class AddTeamIdToVotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :votes, :team, null: false, foreign_key: true
  end
end
