class VotesController < ApplicationController
  def create
    @submission = Submission.find(params[:submission_id])
    raise CanCan::AccessDenied if @submission.user == current_user

    @vote = Vote.new(submission_id: @submission.id, user_id: current_user.id)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to submissions_path, notice: "Thanks for voting!" }
      else
        format.html { redirect_to submissions_path, error: "Ooops something went wrong" }
      end
    end
  end
end
