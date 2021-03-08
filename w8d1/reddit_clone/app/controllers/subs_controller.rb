class SubsController < ApplicationController
  before_action(:require_signed_in, only: [:create, :show, :index, :edit])

  def index
    @subs = Sub.all
    render(:index)
  end

  def new
    render :new
  end

  def create
    @sub = Sub.new(params.require(:sub).permit(:title, :description))
    @sub.user_id = params[:user_id]
    if @sub.save == false 
      flash[:errors] = ["Invalid sub details"]
      render :new
    else
      redirect_to user_url(@sub)
    end
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render(:show)
  end

  def edit
    @sub = Sub.new
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])

    if @sub.update(params.require(:sub).permit(:title, :description))
      redirect_to(user_sub_url(@sub))
    else
      redirect_to(edit_user_sub_url)
    end
  end

end
