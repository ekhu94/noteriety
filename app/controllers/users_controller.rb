class UsersController < ApplicationController
    before_action :require_login, only: [:show]

    def show
        @user = User.find(session[:user_id])
    end

    def new
        @user = User.new
        render layout: 'login'
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new, layout: 'login'
        end
    end

    def login
        render layout: 'login'
    end

    def login_action
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            @user = user
            redirect_to root_path
        else
            flash.now[:login_error] = "There was something wrong with your email or password."
            render :login, layout: 'login'
        end
    end

    def logout
        session.clear
        flash[:logged_out] = "You have successfully logged out."
        redirect_to login_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end