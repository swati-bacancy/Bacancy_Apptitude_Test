class CollagesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user
  before_action :find_collage, only: [:show, :edit, :update, :destroy]

  def index
  	@collages = Collage.all
  end

  def new
  	@collage = Collage.new
  end

  def create
  	@collage = Collage.new(collage_params)
  	if @collage.save
  		redirect_to collages_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @collage.update(collage_params)
  		redirect_to collages_path
  	else
  		render 'edit'
  	end
  end

  def show
  end

  def destroy
  	if @collage.destroy
  		redirect_to collages_path
  	end
  end

  private

  def collage_params
  	params.require(:collage).permit(:name)
  end

  def find_collage
  	@collage = Collage.find(params[:id])
  end
end
