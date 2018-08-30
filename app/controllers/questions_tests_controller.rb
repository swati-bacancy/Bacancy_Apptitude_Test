class QuestionsTestsController < ApplicationController
  def new
  end

  def create
    @test = Test.find(params[:test][:id])
    @question_ids = params[:question][:question_ids].reject(&:empty?)
    @questions = Question.find(@question_ids)
    @test.questions.delete_all
    @questions.each do |question|
      question.tests << @test
    end
    redirect_to questions_tests_path
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:test][:id])
    @question_ids = params[:test][:question_ids].reject(&:empty?)
    @questions = Question.find(@question_ids)
    @test.questions.delete_all
    @questions.each do |question|
      question.tests << @test
    end
    redirect_to questions_tests_path
  end

  def show
    @test = Test.find(params[:id])
  end

  def index
    @tests = Test.all
  end
end
