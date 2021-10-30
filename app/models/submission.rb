class Submission < ApplicationRecord
  belongs_to :user
  has_one :team, through: :user
  has_many :votes, dependent: :destroy

  scope :most_loved, -> { order('votes_count DESC') }

  def pr_state
    return :invalid unless url.include?('github.com')

    github = Octokit::Client.new(:access_token => ENV['GITHUB_PERSONAL_TOKEN'])

    parts = url.split("/")
    org_repo = "#{parts[3]}/#{parts[4]}"
    pull_number = parts.last
    pr = github.pull_request(org_repo, pull_number)

    return "merged" if pr.merged?

    pr.state
  end
end
