class ResultsController < ApplicationController
  before_action :find_result, only: [:show, :destroy]

  def show
  end

  def index
    if(params[:search] == "" || params[:search] == nil)
      @results = Result.all
    else
      @results =  Result.joins(:student).where('students.email like ?', "%#{params[:search]}%")
    end
  end

  def destroy
    @result.destroy
    redirect_to results_path
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end
end
