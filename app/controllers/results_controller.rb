include Pagy::Backend
class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_result, only: [:show, :destroy, :edit, :update, :technical_answers, :check_student_answers]

  require 'csv'

  def index
    @search = params[:search]
    @collage_name = params[:collage_name]
    @search = @search.to_i if @search.present? && @search.count("0-9") == @search.length
    
    if @search.present? || @collage_name.present?
      @results = filter_result(@search,@collage_name)
    else
      @results = Result.includes(student: :test)
    end
    @pagy, @results = pagy(@results)
    # if params[:format] == 'csv'
      respond_to do |format|
        format.js
        format.html
      end
    # end
  end

  def show
  end

  def edit
  end

  def update    
    if @result.update(technical_marks: params[:sum])
      flash[:success] = "Technical Marks Sucsessfully updated!"
      redirect_to results_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  

  def destroy
    @result.destroy
    redirect_to results_path
  end

  def technical_answers    
    @student = @result.student
    @result.update_attributes(checked_by:current_user.first_name)
    @answers = @student.answers.includes(:question)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def check_student_answers
    @student = @result.student
    @student_answers = @student.student_answers
    respond_to do |format|
      format.html
      format.js
    end
  end

  def export_csv
    @search = params[:searchValue]
    @collage_name = params[:dropdownValue]
    @roll_number= params[:roll_number]

    if @search.present? || @collage_name.present?
      @results = filter_result(@search,@collage_name)
    else
      @results = Result.includes(student: :test)
    end  
    respond_to do |format|
      format.csv { send_data @results.to_csv, filename: 'results.csv' }
    end                
  end

  private

  def result_params
    params.require(:result).permit(:total_questions, :attempted_questions, :correct_answer, :roll_number, :technical_marks, :total_marks, :checked_by, :student_id, :test_id)
  end

  def find_result
    @result = Result.find(params[:id])
  end
  
  def filter_result(search,collage_name)
    Result.joins(student: :test)
                .includes(student: :test)
                .where('students.email ilike ?  or students.roll_number ilike ? or students.name ilike ? ', "%#{search}%", "%#{search}%", "%#{search}%")
                .where('students.collage_name ilike ?', "%#{collage_name}%")
  end
end
