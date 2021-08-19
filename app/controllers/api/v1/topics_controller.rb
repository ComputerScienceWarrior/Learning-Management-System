module Api
    module V1
        class TopicsController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :find_topic, only: [:show, :update, :destroy]

            def index
                @topics = Topic.all
                render json: @topics, include: :videos
            end

            def show
                render json: @topics, include: :videos
            end

            def create
                @topic = Topic.new(topic_params)
                if @topic.save
                    render json: @topics, include: :videos
                else 
                    render json: { error: @topic.errors.messages }, status: 422
                end
            end

            def update
                if @topic.update
                    render json: @topics, include: :videos
                else 
                    render json: { error: @topic.errors.messages }, status: 422
                end
            end

            def destroy
                if @topic.destroy
                    head :no_content
                else
                    render json: { error: @topic.errors.messages }, status: 422
                end
            end

            private 

            def find_topic
                @topic = Topic.friendly.find(params[:id])
            end

            def topic_params
                params.require(:topic).permit(:title, :summary, :course_id, :slug, videos_attributes: [:title, :caption, :summary, :video_url, :thumbnail_url, :slug, :topic_id])
            end
        end
    end
end
