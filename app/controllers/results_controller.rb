class ResultsController < ApplicationController
  include Pagy::Backend
  before_action :find_result, only: [:show, :destroy, :edit, :update, :technical_answers, :check_student_answers]
  http_basic_authenticate_with name: Password::USERNAME, password: Password::PASSWORD unless Rails.env == "development"

  require 'csv'

  def index
    @search = params[:search]
    @collage_name = params[:collage_name]
    @search = @search.to_i if @search.present? && @search.count("0-9") == @search.length
    
    if @search.present? || @collage_name.present?
      @results = Result.joins(student: :test)
                .includes(student: :test)
                .where('students.email ilike ?  or students.roll_number ilike ? or students.name ilike ? ', "%#{@search}%", "%#{@search}%", "%#{@search}%")
                .where('students.collage_name ilike ?', "%#{@collage_name}%")
    else
      @results = Result.includes(student: :test)
    end
    @pagy, @results = pagy(@results)
    # if params[:format] == 'csv'
      respond_to do |format|
        format.html
        format.js
      end
    # end
  end

  def show
  end

  def edit
  end

  def update
    if params[:sum].present?
      @result.update_attributes(technical_marks: params[:sum])
      redirect_to results_path
    end
  end

  def destroy
    @result.destroy
    redirect_to results_path
  end

  def technical_answers
    @student = @result.student
    @answers = @student.answers.includes(:question)
    respond_to do |format|
      format.js
    end
  end

  def check_student_answers
    @student = @result.student
    @student_answers = @student.student_answers
    respond_to do |format|
      format.js
    end
  end

  def export_csv    
    @search = params[:search]
    @collage_name = params[:collage_name]
    @roll_number= params[:roll_number]

    if @search.present? || @collage_name.present?
      @results = Result.joins(student: :test)
                .includes(student: :test)
                .where('students.email ilike ?', "%#{@search}%")
                .where('students.collage_name ilike ?', "%#{@collage_name}%")
    else
      @results = Result.includes(student: :test)
    end                  
                  
    respond_to do |format|
      format.csv { send_data @results.to_csv, filename: 'results.csv' }
    end                
  end

  private

  def find_result
    @result = Result.find(params[:id])
  end
end
