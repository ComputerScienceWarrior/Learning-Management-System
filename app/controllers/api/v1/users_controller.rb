module Api
    module V1
        class UsersController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :find_user, only: [:show, :update, :destroy]

            def index
                @users = User.all
                render json: @users
            end

            def show
                render json: @user
            end

            def create
                @user = User.new(user_params)
                if @user.save
                    render json: @user
                else 
                    render json: { error: @user.errors.messages }, status: 422
                end
            end

            def update
                if @user.update
                    render json: @user
                else 
                    render json: { error: @user.errors.messages }, status: 422
                end
            end

            def destroy
                if @user.destroy
                    head :no_content
                else
                    render json: { error: @user.errors.messages }, status: 422
                end
            end

            private 

            def find_user
                @user = User.friendly.find(params[:id])
            end

            def user_params
                params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
            end
        end
    end
end
