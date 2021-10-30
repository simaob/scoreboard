class HomeController < ApplicationController
  def index; end

  def dashboard
    @selection = [:teams, :submissions].shuffle.first
    if @selection == :teams
      @teams = Team.all
      render "teams/index"
    else
      @submissions = Submission.most_loved.page(params[:page]).per(1000)
      render "submissions/index"
    end
  end
end
