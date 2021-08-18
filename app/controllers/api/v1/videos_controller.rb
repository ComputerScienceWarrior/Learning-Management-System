module Api
    module V1
        class VideosController < ApplicationController
            before_action :find_video, only: [:show, :update, :destroy]

            def index
                @videos = Video.all
                render json: VideoSerializer.new(@videos).serialized_json
            end

            def show
                render json: VideoSerializer.new(@video).serialized_json
            end

            def create
                @video = Video.new(video_params)
                if @video.save
                    render json: VideoSerializer.new(@video).serialized_json
                else 
                    render json: { error: @video.errors.messages }, status: 422
                end
            end

            def update
                if @video.update
                    render json: VideoSerializer.new(@video).serialized_json
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
