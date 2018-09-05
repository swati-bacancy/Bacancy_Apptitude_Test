class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "Bacancy", password: "Bacancy", only: [:index, :edit, :destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.test_id = Test.ids.sample
    if @student.save
      redirect_to new_student_answer_path
      flash[:success] = "Welcome to the Test Page!"
    else
      render 'new'
    end
    session[:student_id] = @student.id
  end

  def edit
  end

  def existing_user
  end

  def assign_test
    @student = Student.find_by(email: params[:email])
    if @student.present?
      @student.update_attributes(test_started: false)
      @test_ids = Test.all.ids
      @student_test_ids = @student.student_answers.pluck(:test_id).uniq
      @test_ids = @test_ids - @student_test_ids
      if @test_ids.present?
        @student.update_attributes(test_id: @test_ids.sample)
        session[:student_id] = @student.id
        redirect_to new_student_answer_path
      else
        redirect_to root_path
        flash[:alert] = "You have already attended All Tests!"
      end
    else
      redirect_to student_existing_user_path
      flash[:alert] = "Please create a new user!"
    end
  end

  def update
    if @student.update(student_params)
      response do |format|
        format.html redirect_to students_path
        format.js
      end
    else
      render 'edit'
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path
  end

  def show
  end

  def logout
    session[:student_id] = nil
    redirect_to root_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :course, :roll_number, :collage_name, :mobile_number, :test_id, :test_started)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
