module Api
    module V1
        class VideosController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :find_video, only: [:show, :update, :destroy]

            def index
                @videos = Video.all
                render json: @videos
            end

            def show
                render json: @video
            end

            def create
                @video = Video.new(video_params)
                if @video.save
                    render json: @video
                else 
                    render json: { error: @video.errors.messages }, status: 422
                end
            end

            def update
                if @video.update
                    render json: @video
                else 
                    render json: { error: @video.errors.messages }, status: 422
                end
            end

            def destroy
                if @video.destroy
                    head :no_content
                else
                    render json: { error: @video.errors.messages }, status: 422
                end
            end

            private 

            def find_video
                @video = Video.friendly.find(params[:id])
            end

            def video_params
                params.require(:video).permit(:title, :caption, :summary, :video_url, :thumbnail_url, :slug, :topic_id)
            end
        end
    end
end
