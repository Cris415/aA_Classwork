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
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat.id)
        else
            # p "testing"
            # render :show
        end
    end


    private

    def cat_params
      cat_param = params.require(:cats).permit(:name, :color, :sex, :description, :birth_date)
    end





end

