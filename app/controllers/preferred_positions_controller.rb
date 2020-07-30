class PreferredPositionsController < ApplicationController
  before_action :set_preferred_position, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: Password::USERNAME, password: Password::PASSWORD unless Rails.env == "development"

  # GET /preferred_positions
  # GET /preferred_positions.json
  def index
    @preferred_positions = PreferredPosition.all
  end

  # GET /preferred_positions/1
  # GET /preferred_positions/1.json
  def show
  end

  # GET /preferred_positions/new
  def new
    @preferred_position = PreferredPosition.new
  end

  # GET /preferred_positions/1/edit
  def edit
  end

  # POST /preferred_positions
  # POST /preferred_positions.json
  def create
    @preferred_position = PreferredPosition.new(preferred_position_params)

    respond_to do |format|
      if @preferred_position.save
        format.html { redirect_to @preferred_position, notice: 'Preferred position was successfully created.' }
        format.json { render :show, status: :created, location: @preferred_position }
      else
        format.html { render :new }
        format.json { render json: @preferred_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preferred_positions/1
  # PATCH/PUT /preferred_positions/1.json
  def update
    respond_to do |format|
      if @preferred_position.update(preferred_position_params)
        format.html { redirect_to @preferred_position, notice: 'Preferred position was successfully updated.' }
        format.json { render :show, status: :ok, location: @preferred_position }
      else
        format.html { render :edit }
        format.json { render json: @preferred_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preferred_positions/1
  # DELETE /preferred_positions/1.json
  def destroy
    @preferred_position.destroy
    respond_to do |format|
      format.html { redirect_to preferred_positions_url, notice: 'Preferred position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preferred_position
      @preferred_position = PreferredPosition.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def preferred_position_params
      params.require(:preferred_position).permit(:name)

    end
end
