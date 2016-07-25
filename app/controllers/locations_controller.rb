class LocationsController < ApplicationController
   def new
    @location = Location.new
  end

  def create
    @location = Location.new(params.require(:location).permit(:region, :institution))
    if @location.save
      redirect_to @location
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(params.require(:tag).permit(:keyword))
      redirect_to @location
    else
      render 'edit'
    end
  end
  
  def index
    @locations = Location.all
  end
  
  def show
    @location = Location.find(params[:id])
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    
    redirect_to locations_path
  end

  def explore

  end

  private 
  def locations_params
    params.require(:location).permit(:region, :institutiony)
  end
end

