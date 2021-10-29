class Vote < ApplicationRecord
  belongs_to :team
  belongs_to :submission, counter_cache: true

  validates :team_id, uniqueness: {scope: :submission_id,
                                   message: "Only one vote per submission, Mr."}
end
