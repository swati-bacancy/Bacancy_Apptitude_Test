class StudentAnswersController < ApplicationController
  def new
    if session[:student_id].present?
      @student_answer = StudentAnswer.new
      s = Student.find(session[:student_id])
      s.start_time = DateTime.now
      s.save
    else
      redirect_to root_path
    end
  end

  def create
    params[:response_item] && params[:response_item].each{|k, value|
      @student_answer = StudentAnswer.new
      @student_answer.student = Student.find(session[:student_id])
      @student_answer.question_id = k
      @student_answer.option_id = value
      @student_answer.test_id = Student.find(session[:student_id]).test.id
      @student_answer.save
    }

    @result =  Result.new
    @student = Student.find(session[:student_id])
    @result.student_id = @student.id
    @count = 0
    @student.student_answers.each do |i|
      if i.option.is_answer== true && i.test_id == @student.test_id
        @count += 1
      end
    end
    @result.correct_answer = @count
    @result.attempted_questions = @student.student_answers.where(test_id: @student.test_id).count
    @result.total_questions = @student.test.questions.count
    @result.test_id = @student.test.id
    @result.save
    redirect_to root_path
  end

  def index
  end

  def show
  end

  def edit
  end
end
