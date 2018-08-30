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

    @result =  Result.new
    @student = Student.find(session[:student_id])
    @result.student_id = @student.id
    @count = 0
    @student.student_answers.each do |i|
      if i.option.is_answer== true
        @count += 1
      end
    end
    @result.correct_answer = @count
    @result.attempted_questions = @student.student_answers.count
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
