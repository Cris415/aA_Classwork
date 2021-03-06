class UsersController < ApplicationController
  def index
    user = User.all
    render json: user
  end

  def create 
    user = User.new(user_params)
    # replace the `user_attributes_here` with the actual attribute keys
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show 
    user = User.find_by(id: params[:id])
    render json: user
  end

  def update
    user = User.find_by(id: params[:id])

    user.update(user_params)

    render json: user

  end

  def destroy
    user = User.find_by(id: params[:id])

    user.destroy

    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

end
