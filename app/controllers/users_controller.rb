class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            render :new
        end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private 

    def find_user
        @user = User.friendly.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end

end
