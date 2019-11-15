class StudentAnswersController < ApplicationController
  before_action :find_student, only: [:new, :create, :new_technical, :create_technical]

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
    # redirect_to root_path
    flash[:success] = "Your Aptitude Test submitted successfully"
    tech_test = Test.technical.ids.sample
    if tech_test.present?
      @student.update_attributes(test_id: Test.technical.ids.sample, test_started: false)
      redirect_to new_technical_student_answers_path
      flash[:success] = "Your Aptitude Test submitted successfully And Start your Technical Test!"
    else
      redirect_to root_path
      flash[:success] = "Your Aptitude Test submitted successfully And No Technical Test available! "
    end
  end

  def new_technical
    if session[:student_id].present?
      @answer = Answer.new
      return redirect_to root_path if @student.test_started?
      @student.update_attributes(test_started: false, start_time: DateTime.now)
    else
      redirect_to root_path
    end
  end

  def create_technical
    params[:response_item] && params[:response_item].each{|k, value|
      @answer = Answer.create(
                          student_id: session[:student_id],
                          question_id: k,
                          answer: value,
                        )
    }
    redirect_to root_path
    flash[:success] = "Your Technical Test submitted successfully!"
  end

  private

  def find_student
    @student = Student.find(session[:student_id])
  end
end
