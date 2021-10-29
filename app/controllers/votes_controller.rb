class VotesController < ApplicationController
  def create
    @submission = Submission.find(params[:submission_id])
    raise CanCan::AccessDenied unless current_user.can_vote_for?(@submission)

    @vote = Vote.new(submission_id: @submission.id, user_id: current_user.id)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to submissions_path, notice: "Thanks for voting!" }
      else
        format.html { redirect_to submissions_path, error: "Ooops something went wrong" }
      end
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    raise CanCan::AccessDenied if @vote.user != current_user
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: "Vote deleted sucessfully!" }
    end
  end
end
