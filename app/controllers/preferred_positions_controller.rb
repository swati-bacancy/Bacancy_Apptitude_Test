class PreferredPositionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  before_action :set_preferred_position, only: [:show, :edit, :update, :destroy]

  def index
    @preferred_positions = PreferredPosition.all
  end

  def show; end

  def new
    @preferred_position = PreferredPosition.new
  end

  def edit; end

  def create
    @preferred_position = PreferredPosition.new(preferred_position_params)
    if @preferred_position.save
      redirect_to preferred_positions_path, notice: 'Preferred position was successfully created.'
    else
      render :new
    end
  end

  def update
    if @preferred_position.update(preferred_position_params)
      redirect_to preferred_positions_path, notice: 'Preferred position was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @preferred_position.destroy
    redirect_to preferred_positions_url, notice: 'Preferred position was successfully destroyed.'
  end

  private

  def set_preferred_position
    @preferred_position = PreferredPosition.find(params[:id])
  end

  def preferred_position_params
    params.require(:preferred_position).permit(:name, :tech, :non_tech)
  end

  def check_user
    runless current_user.has_role?(:HR)
      flash[:alert] = "You are not authorized to access this page."
      redirect_to root_path
    end   
  end
end
