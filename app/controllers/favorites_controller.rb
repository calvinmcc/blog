class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @favorite = Favorite.new(post: @post, user: current_user)
    respond_to do |format|
      if @favorite.save
        format.html { redirect_to :back, notice: 'Post favorited!' }
        format.js { render :favorite_success }
      else
        format.html { redirect_to :back, alert: 'Unable to favorite' }
      end
    end
  end

  def destroy
    @post = Post.find params[:post_id]
    @favorite = Favorite.find(params[:id])
    respond_to do |format|
      if @favorite.destroy
        format.html { redirect_to :back, notice: 'Post unfavorited' }
        format.js { render }
      else
        format.html { redirect_to :back, alert: 'Unable to remove favorite' }
      end
    end
  end
end
