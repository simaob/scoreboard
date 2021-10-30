class HomeController < ApplicationController
  def index; end

  def dashboard
    @selection = [:teams, :submissions].shuffle.first
    if @selection == :teams
      @teams = Team.all
      render "teams/index"
    else
      @submissions = Submission.most_loved
      render "submissions/index"
    end
  end
end
