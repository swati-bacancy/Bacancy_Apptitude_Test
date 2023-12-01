include Pagy::Backend
class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: Password::USERNAME, password: Password::PASSWORD, only: [:index, :edit, :destroy] unless Rails.env == "development"

  def index
    @students = Student.all
    @pagy, @students = pagy(@students, items: 15)
  end

  def new
    @student = Student.new
  end

  def create    
    @student = Student.new(student_params)
  
    # pr loc no_tech true
    if @student.preferred_position&.non_tech
      # for mcq
      @student.test_id = Test.non_technical.ids.sample
    else
      # for code question
      @student.test_id = Test.technical.ids.sample
    end
    # else
    # @student.test_id = Test.technical.ids.sample
    if @student.save
      if @student.preferred_position&.non_tech
        redirect_to new_student_answer_path
      else
        redirect_to new_technical_student_answers_path
      end
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
    params.require(:student).permit(:name, :email, :roll_number, :collage_name, :test_id, :test_started, :preferred_position_id)
  end

  def find_student
    @student = Student.find(params[:id])
  end
end
