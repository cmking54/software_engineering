class UpDownVotesController < ApplicationController
  before_action :authenticate_user!

  def upvote
    dovote(true)
  end

  def downvote
    dovote(false)
  end

private
  def dovote(updown)
    begin
      sight = Sight.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "No such sight" 
      redirect_to sights_path and return
    end
    sight.up_down_votes.create(:upvote => updown, :user => current_user)
    respond_to do |format|
      format.html do
        flash[:notice] = "You #{updown ? "upvoted" : "downvoted"} #{sight.title}"
        redirect_to sight_path(sight) and return
      end
      format.json do
        render json: {up: sight.upvotes, down: sight.downvotes}, :status => :ok
      end
    end
  end
end
