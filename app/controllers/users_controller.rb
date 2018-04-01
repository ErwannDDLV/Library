class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :destroy, :update]

    def index
        @users = User.all.order('updated_at DESC')
    end

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "#{@user.first_name} #{@user.last_name} added"
            redirect_to @user
        else
            render 'new'
        end
    end

    def edit        
    end

    def update
        if @user.update(user_params)
            redirect_to @user
        else
            render 'index'
        end
    end

    def destroy
        if @user.destroy
            redirect_to users_path
            flash[:alert] = "User has been deleted"
        else
            render 'edit'
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name, :avatar)
    end 
end