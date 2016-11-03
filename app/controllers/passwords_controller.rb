class PasswordsController < ApplicationController

  def new
  end

  def edit
    @password = params.dig(:user, :password)
    @user = current_user
  end

  def update
      @user = User.find current_user
      current_password = params.dig(:user, :current_password)
      user_params = params.require(:user).permit([:first_name, :last_name,
                                                  :email, :password,
                                                  :password_confirmation])
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

end
