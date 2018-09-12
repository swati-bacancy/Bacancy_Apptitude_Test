class TechnicalQuestionsController < ApplicationController
  before_action :find_technical_question, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: Password::USERNAME, password: Password::PASSWORD

  def index
  	@technical_questions = Question.technical
  end

  def new
    @technical_question = Question.new
  end

  def create
    @technical_question = Question.new(technical_question_params)
    @technical_question.is_technical = true
    if @technical_question.save
      redirect_to technical_questions_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @technical_question.update(technical_question_params)
      @technical_question.is_technical = true
      redirect_to technical_questions_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @technical_question.destroy
    redirect_to technical_questions_path
  end

  private

  def technical_question_params
  	params.require(:question).permit(:question_description, :is_technical)
  end

  def find_technical_question
  	@technical_question = Question.find(params[:id])
  end
end
