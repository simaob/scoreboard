class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team, optional: true
  has_many :submissions
  has_many :votes

  def can_vote_for? submission
    # not their submission or submission from their team
    # still has votes
    # hasn't voted for it yet
    submission.user != self && submission.user.team != self.team &&
      votes.count < MAXIMUM_VOTES_PER_USER && votes.where(submission_id: submission.id).none?
  end

  def voted_for? submission
    votes.where(submission_id: submission.id).any?
  end

  def github_link
    github && "https://github.com/#{github}"
  end
end
