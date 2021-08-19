module Api
    module V1
        class TopicsController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :find_topic, only: [:show, :update, :destroy]

            def index
                @topics = Topic.all
                render json: TopicSerializer.new(@topics).serialized_json
            end

            def show
                render json: TopicSerializer.new(@topic, options).serialized_json
            end

            def create
                @topic = Topic.new(topic_params, options)
                if @topic.save
                    render json: TopicSerializer.new(@topic).serialized_json
                else 
                    render json: { error: @topic.errors.messages }, status: 422
                end
            end

            def update
                if @topic.update
                    render json: TopicSerializer.new(@topic, options).serialized_json
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

            def options
                @options ||= { include: %i[videos]}
            end
        end
    end
end
