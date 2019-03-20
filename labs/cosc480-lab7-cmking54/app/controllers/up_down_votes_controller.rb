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
      flash[:alert] = t "no_such_sight" 
      redirect_to sights_path and return
    end
    sight.up_down_votes.create(:upvote => updown, :user => current_user)
    flash[:notice] = "#{t("you")} #{updown ? t("upvoted") : t("downvoted")} #{sight.title}"
    redirect_to sight_path(sight) and return
  end
end
