class Submission < ApplicationRecord
  belongs_to :user
  has_one :team, through: :user
  has_many :votes

  scope :most_loved, -> { order('votes_count DESC') }
end
