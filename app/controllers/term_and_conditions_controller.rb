class TermAndConditionsController < ApplicationController
  before_action :set_term_and_condition, only: [:show, :edit, :update, :destroy]

  def index
    @term_and_conditions = TermAndCondition.all
  end
  
  def new
    @term_and_condition = TermAndCondition.last
  end

  def create    
    @term_and_condition = TermAndCondition.new(term_and_condition_params)

    if @term_and_condition.save
      redirect_to term_and_conditions_path, notice: 'Terms and conditions were successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @term_and_condition.update(term_and_condition_params)
      redirect_to new_term_and_condition_path, notice: 'Terms and conditions were successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_term_and_condition
    @term_and_condition = TermAndCondition.find(params[:id])
  end

  def term_and_condition_params
    params.require(:term_and_condition).permit(:content)
  end
end
