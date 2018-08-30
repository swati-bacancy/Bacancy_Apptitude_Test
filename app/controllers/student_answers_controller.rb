class StudentAnswersController < ApplicationController
  def new
    @student_answer = StudentAnswer.new
  end

  def create
    params[:response_item].each{|k, value|
      @student_answer = StudentAnswer.new
      @student_answer.student = Student.find(session[:student_id])
      @student_answer.question_id = k
      @student_answer.option_id = value
      @student_answer.save
    }
    redirect_to root_path
    # binding.pry
  end
  def index
  end

  def show
  end

  def edit
  end
end
