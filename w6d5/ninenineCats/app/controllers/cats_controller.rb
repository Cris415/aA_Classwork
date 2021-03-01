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
            redirect_to cat_url(@cat)
        else
            render :index
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def edit
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    def update 
        @cat = Cat.find_by(id: params[:id])

        if cat.update(cat_params)
            redirect_to user_url(params[:id])
        end
    end



    def destroy 
        cat = Cat.find_by(id: params[:id])
        cat.destroy

        redirect_to users_url
    end


    private

    def cat_params
      cat_param = params.require(:cats).permit(:name, :color, :sex, :description, :birth_date)
    end





end

