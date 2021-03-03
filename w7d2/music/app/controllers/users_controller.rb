class UsersController < ApplicationController
  before_action :un_signed_in, only: [:new]
  def show
    @user = User.find_by(id: params[:id])
    if @user
      render :show
    else
      redirect_to :new
    end
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      login!(@user)
      redirect_to user_url(@user)
    else
      :new
    end
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
