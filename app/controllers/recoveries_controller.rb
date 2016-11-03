class RecoveriesController < ApplicationController
  def new

  end

  def create
    if User.find_by_email(params[:email]).present?
      redirect_to edit_recovery_path
    end
  end

  def show
    p "hey"
  end

end
