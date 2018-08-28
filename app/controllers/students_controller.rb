class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.test_id = Test.ids.sample
    if @student.save
      redirect_to students_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      redirect_to students_path
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def index
    @students = Student.all
  end

  def show
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :course, :roll_number, :collage_name, :mobile_number, :test_id)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
