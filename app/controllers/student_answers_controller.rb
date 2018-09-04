class StudentAnswersController < ApplicationController
  before_action :find_student, only: [:new, :create]

  def new
    if session[:student_id].present?
      @student_answer = StudentAnswer.new
      return redirect_to root_path if @student.test_started?
      @student.update_attributes(test_started: false, start_time: DateTime.now)
    else
      redirect_to root_path
    end
  end

  def create
    params[:response_item] && params[:response_item].each{|k, value|
      @student_answer = StudentAnswer.create(
                          student_id: session[:student_id],
                          question_id: k,
                          option_id: value,
                          test_id: @student.test.id)
    }

    @result =  Result.new(student_id: @student.id)
    @count = 0
    @student.student_answers.map {|i| @count+=1 if (i.option.is_answer == true && i.test_id == @student.test_id)}
    @test = @student.test
    @result.update_attributes(correct_answer: @count,
    attempted_questions: @student.student_answers.where(test_id: @test.id).count,
    total_questions: @test.questions.count,
    test_id: @test.id)
    session[:student_id] = nil
    redirect_to root_path
  end

  private

  def find_student
    @student = Student.find(session[:student_id])
  end
end
