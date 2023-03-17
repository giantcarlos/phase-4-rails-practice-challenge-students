class StudentsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

    def index
        students = Student.all
        render json: students
    end
    
    def show
        student = Student.find_by(id: params[:id])
        render json: student
    end

    def create
        student = Student.create(student_params)
        render json: student
    end

    def update
        student = Student.find_by(id: params[:id])
        student.update(student_params)
        render json: student
    end

    def destroy
        student = Student.find_by(id: params[:id])
        student.destroy
        head :no_content
    end


    private

    def student_params
        params.permit(:name, :major, :age)
    end

    def render_invalid(invalid)
        render json: { errors: invalid.record.errors }, status: unprocessable_entity
    end

end
