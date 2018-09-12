class ResultsController < ApplicationController
  before_action :find_result, only: [:show, :destroy]
  http_basic_authenticate_with name: Password::USERNAME, password: Password::PASSWORD

  require 'csv'

  def index
    if(params[:search] || params[:collage_name])
      @results =  Result.joins(:student).where('students.email ilike ? and students.collage_name ilike ?', "%#{params[:search]}%", "%#{params[:collage_name]}%")
    else
      @results = Result.all
    end
    if params[:format] == 'csv'
      respond_to do |format|
        format.html
        format.csv { send_data @results.to_csv }
      end
    end
  end

  def show
  end

  def destroy
    @result.destroy
    redirect_to results_path
  end

  def technical_answers
    @student = Student.find(params[:student_id])
    @answers = @student.answers
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end
end
