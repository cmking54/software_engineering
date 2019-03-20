class SightsController < ApplicationController
  def index
    # order first by upvotes, but include any sights w/o any votes
    @sights = Sight.by_upvotes + Sight.no_votes
  end

  def show
    begin
      @sight = Sight.find(params[:id])
      @comments = @sight.comments
      @upvotes = @sight.up_down_votes.where("upvote = ?", true)
      @downvotes = @sight.up_down_votes.where("upvote = ?", false)
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = "No such sight"
      redirect_to sights_path and return
    end
  end
end
