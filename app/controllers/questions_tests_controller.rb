class QuestionsTestsController < ApplicationController
  before_action :find_test, only: [:edit, :update, :show]

  def index
    @tests = Test.all
  end

  def edit
  end

  def update
    @question_ids = params[:test][:question_ids].reject(&:empty?)
    @questions = Question.find(@question_ids)
    @test.questions.destroy_all
    @questions.each do |question|
      question.tests << @test
    end
    redirect_to questions_tests_path
  end

  def show
  end

  private

  def find_test
    @test =  Test.find(params[:id])
  end
end
