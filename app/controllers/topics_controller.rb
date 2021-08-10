class TopicsController < ApplicationController

    before_action :find_topic, only: [:show]
    def index
        @topic = Topic.all
    end

    def show
    end

    private 

    def find_course_and_topic
        @topic = Topic.friendly.find(params[:id])
        @course = Course.friendly.find(params[:course_id])
    end
end
