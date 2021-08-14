module Api
    module V1
        class CoursesController < ApplicationController
            def index
                courses = Course.all
                render json: CourseSerializer.new(courses).serialized_json
            end

            def show
                course = Course.friendly.find(params[:id])
                render json: CourseSerializer.new(course).serialized_json
            end
        end
    end
end
