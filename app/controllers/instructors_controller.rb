class InstructorsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid 

    def index
        instructors = Instructor.all
        render json: instructors
    end
    
    def show
        instructor = Instructor.find_by(id: params[:id])
        render json: instructor
    end

    def create
        instructor = Instructor.create(instructor_params)
        render json: instructor
    end

    def update
        instructor = Instructor.find_by(id: params[:id])
        instructor.update(instructor_params)
        render json: instructor
    end

    def destroy
        student = Student.find_by(id: params[:id])
        student.destroy
        head :no_content
    end
    

    private

    def instructor_params
        params.permit(:name)
    end

    def render_invalid(invalid)
        render json: { errors: invalid.record.errors }, status: unprocessable_entity
    end

end
