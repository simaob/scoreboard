class Team < ApplicationRecord
  has_many :users, dependent: :nullify
  has_many :submissions, through: :users
  has_many :votes, through: :users
  has_many :votes_received, through: :submissions, source: :votes

  def submissions_count
    submissions.count
  end

  def votes_cast_count
    votes.count
  end

  def votes_received_count
    votes_received.count
  end
end
