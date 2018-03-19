class UsersController < ApplicationController
    before_action :set_user, only: [:show, :destroy]

    def index
        @users = User.all
    end

    def show
        @user
    end

    def create
        @user = User.new(user_params)
        @user.save
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
    
        redirect_to users_path
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name)
    end 
end