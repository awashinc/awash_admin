class Admin::WashingCommentsController < Admin::ApplicationController

  before_filter :get_washing

  def index
    @washing_comments = @washing.washing_comments.page(params[:page]).per(30)
  end

  def create
    @washing_comment = @washing.washing_comments.new(washing_comment_params)
    @washing_comment.user = current_user
    if @washing_comment.save
      redirect_to admin_washing_washing_comments_path(@washing), :notice => "Successfully created washing comment."
    else
      render :new
    end
  end

 def edit
   @washing_comment = WashingComment.find(params[:id])
 end

  def update
    @washing_comment = WashingComment.find(params[:id])
    if @washing_comment.update_attributes(washing_comment_params)
      redirect_to admin_washing_comments_url, :notice  => "Successfully updated washing comment."
    else
      render :edit
    end
  end

  def destroy
    @washing_comment = WashingComment.find(params[:id])
    @washing_comment.destroy
    redirect_to admin_washing_comments_url, :notice => "Successfully destroyed washing comment."
  end

  private
  def get_washing
    @washing = Washing.where(id: params[:washing_id]).first
    redirect_back(fallback_location: admin_root_path)  if @washing.blank?

  end


  def washing_comment_params
    params.require(:washing_comment).permit(:washing_id, :user_id, :comment, :image)
  end
end
