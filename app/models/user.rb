class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :team, optional: true
  has_many :submissions
  has_many :votes

  def can_vote_for? submission
    submission.user != self && votes.count < 6 && votes.where(submission_id: submission.id).none?
  end

  def voted_for? submission
    votes.where(submission_id: submission.id).any?
  end
end
