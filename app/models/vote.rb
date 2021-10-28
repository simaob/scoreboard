class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :submission, counter_cache: true

  validates :user_id, uniqueness: {scope: :submission_id,
                                   message: "Only one vote per submission, Mr."}
end
