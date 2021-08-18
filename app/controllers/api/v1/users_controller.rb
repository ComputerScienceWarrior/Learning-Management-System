module Api
    module V1
        class UsersController < ApplicationController
            before_action :find_user, only: [:show, :update, :destroy]

            def index
                @users = User.all
                render json: UserSerializer.new(@users).serialized_json
            end

            def show
                render json: UserSerializer.new(@user).serialized_json
            end

            def create
                @user = User.new(user_params)
                if @user.save
                    render json: UserSerializer.new(@user).serialized_json
                else 
                    render json: { error: @user.errors.messages }, status: 422
                end
            end

            def update
                if @user.update
                    render json: UserSerializer.new(@user).serialized_json
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
