class QuestionsController < ApplicationController

  before_action :find_question, only: [:show]
  http_basic_authenticate_with name: "Bacancy", password: "Bacancy"
  def create
    @question = Question.new(question_params)
    if @question.save
  		redirect_to questions_path
  	else
  		render 'new'
  	end
  end

  def new
  	@question = Question.new
    @option = @question.options.build
  end

  def edit
  	@question = Question.find(params[:id])
  end

   def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      @option = @question.options.build
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def index
  	@questions = Question.all
  end

  def show
    @option = @question.options
  end

  def destroy
  	@question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

private
  def question_params
  	params.require(:question).permit(:question_description, options_attributes: [:id, :option, :option_value, :is_answer, :_destroy])
  end

  def find_question
  	@question = Question.find(params[:id])
  end
end
