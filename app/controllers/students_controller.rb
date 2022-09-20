class StudentsController < ApplicationController
  # def index
  #   if params[:name]
  #     students =
  #       Student.select { |student| student.first_name == params[:name] } ||
  #         Student.select { |student| student.last_name == params[:name] }
  #   else
  #     students = Student.all
  #   end
  #   render json: students
  # end

  def index
    # all the instances of a class
    if params[:name]
      students =
        Student.select do |student|
          student.first_name == params[:name] ||
            student.last_name == params[:name]
        end
    else
      students = Student.all
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

  def grades
    grades = Student.all.order(:grade).reverse
    render json: grades
  end

  def highest_grade
    grade = Student.all.order(:grade).reverse.first
    render json: grade
  end
end
