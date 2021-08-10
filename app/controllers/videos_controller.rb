class VideosController < ApplicationController

    before_action :find_video_and_topic, only: [:index, :show]

    def index
        @videos = @topic.video
    end

    def show
    end

    private

    def find_video_and_topic
        @video = Video.friendly.find(params[:id])
        @topic = Topic.friendly.find(params[:topic_id])
    end
end
