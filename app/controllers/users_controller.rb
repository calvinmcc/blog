class UsersController < ApplicationController


  def edit
    @user = current_user
  end

  def update
    @user = User.find params[:id]
    current_password = params.dig(:user, :password)
    user_params = params.require(:user).permit([:first_name, :last_name, :email])
    if @user && @user.authenticate(current_password)
      if @user.update user_params
        redirect_to home_path, notice: "Profile updated!"
      else
        flash.now[:alert] = "wrong credentials"
        render :edit
      end
    else
      render :edit
    end
  end

  def show
    @favorites = current_user.favorites
    @user = current_user
  end

end
