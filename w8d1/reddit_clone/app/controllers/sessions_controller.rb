class SessionsController < ApplicationController

    before_action(:require_signed_in, only:[:destroy])
    
    def create
        @user = User.find_by_credentials(params[:user][:username],params[:user][:password])

        if @user
            sign_in!(@user)
            redirect_to(user_url(@user))
        else
            flash[:errors] = ["Invalid Username or Password"]
            redirect_to(new_session_url)
        end
    end

    def new
        @user User.new
        render(:new)
    end

    def destroy
        sign_out!
        redirect_to(:new_session_url)
    end
end
