class ResultsController < ApplicationController
  before_action :find_result, only: [:show, :destroy]

  def show
  end

  def index
    @results = Result.all
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
