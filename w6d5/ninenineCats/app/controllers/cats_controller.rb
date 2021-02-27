class CatsController < ApplicationController

    def index
        @cats = Cat.all

        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])

        render :show
    end

    def create
        @cat = Cat.new(user_params)
     if user.save
      render :create
     else
      render :create.errors.full_messages, status: :unprocessable_entity
     end
    end





    private

    def user_params
      user_param = params.require(:user).permit(:name, :email)
    end





end

