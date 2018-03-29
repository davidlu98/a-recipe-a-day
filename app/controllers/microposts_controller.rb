class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  #before_action :admin_user, only: :destroy

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Post created!"
      redirect_to current_user
    else
      flash[:danger] = "Post too long! Max description length of 110 characters."
      @feed_items = []
      redirect_to root_url
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Post deleted!"
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:title, :content, :picture)
    end

    def correct_user
      #@micropost = current_user.microposts.find_by(id: params[:id])
      @user = User.find_by(id: params[:user_id])
      @micropost = @user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
