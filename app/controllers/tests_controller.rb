class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only:[:show, :edit, :update, :destroy]
  before_action :check_user

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to edit_questions_test_path(@test)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render 'edit'
    end
  end

  def index
    @tests = Test.all
  end

  def show
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end
  private

  def test_params
    params.require(:test).permit(:name, :total_time, :is_technical)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def check_user
    unless current_user.has_role?(:HR)
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end   
  end
end
