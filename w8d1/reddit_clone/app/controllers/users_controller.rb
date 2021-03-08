class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save == false
      flash[:errors] = ["Invalid User"]
      render :new
    else
      redirect_to user_url(@user)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end


end
