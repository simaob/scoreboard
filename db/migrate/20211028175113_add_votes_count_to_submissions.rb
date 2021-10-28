class AddVotesCountToSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_column :submissions, :votes_count, :integer, default: 0
  end
end
