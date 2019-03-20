class CommentsController < ApplicationController
  def create
    begin
        @sight = Sight.find(params[:id])
        @comment = Comment.new(create_update_params)
        @sight.comments << @comment
    rescue ActiveRecord::RecordNotFound
        flash[:alert] =  "Not Such Sight"
        redirect_to sights_path and return
    end
    current_user.comments << @comment
    if @comment.save
      render :partial => @comment
    else
      redirect_to sight_path(@sight)
    end
  end
  private
  def create_update_params
    params.require(:comment).permit(:comment)
  end
end
