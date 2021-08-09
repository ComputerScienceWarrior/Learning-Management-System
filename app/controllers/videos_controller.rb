class VideosController < ApplicationController

    before_action :find_video_and_topic, only: [:show]

    def index
        @videos = @topic.video
    end

    def show
    end

    private

    def find_video_and_topic
        @video = Video.find(params[:id])
        @topic = @video.topic
    end
end
