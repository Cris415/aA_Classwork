class UsersController < ApplicationController
  before_action(:require_signed_in, only:[:show,:destroy])

  def new
    @user = User.new

  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save == false
      flash[:errors] = ["Invalid User"]
      render :new
    else
      sign_in!(@user)
      redirect_to user_url(@user)
    end
  end

  def show
    @subs = Sub.all
    @user = User.find_by(id: params[:id])
    render :show
  end

  def index
    @users = User.all
    render(:index)
  end

  def destroy
    user = User.find_by(id: params[:id])

    user.destroy

    redirect_to(users_url)
  end

  def edit
     @user = User.new
     render(:edit)
  end

  def update
     @user = User.find_by(id: params[:id])

     if @user.update(params.require(:user).permit(:username, :password))
      redirect_to(user_url(@user))
     else
      redirect_to(edit_user_url(@user))
     end
  end

end
