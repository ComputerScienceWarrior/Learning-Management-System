module Api
    module V1
        class CoursesController < ApplicationController
            protect_from_forgery with: :null_session
            before_action :find_course, only: [:show, :update, :destroy]

            def index
                @courses = Course.all
                render json: CourseSerializer.new(@courses).serialized_json
            end

            def show
                render json: CourseSerializer.new(@course, options).serialized_json
            end

            def create
                @course = Course.new(course_params)
                if @course.save
                    render json: CourseSerializer.new(@course, options).serialized_json
                else 
                    render json: { error: @course.errors.messages }, status: 422
                end
            end

            def update
                if @course.update(course_params)
                    render json: CourseSerializer.new(@course, options).serialized_json
                else 
                    render json: { error: @course.errors.messages }, status: 422
                end
            end

            def destroy
                if @course.destroy
                    head :no_content
                else
                    render json: { error: @course.errors.messages }, status: 422
                end
            end

            private 

            def find_course
                @course = Course.friendly.find(params[:id])
            end

            def course_params
                params.require(:course).permit(:title, :summary, :category, topics_attributes: [:title, :summary, :slug, :course_id])
            end

            def options
                @options ||= { include: %i[topics]}
            end
        end
    end
end
