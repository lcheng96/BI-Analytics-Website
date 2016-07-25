class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(params.require(:tag).permit(:keyword))
    if @tag.save
      redirect_to @tag
    else
      render 'new'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(params.require(:tag).permit(:keyword))
      redirect_to @tag
    else
      render 'edit'
    end
  end
  
  def index
    @tags = Tag.all
  end
  
  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    
    redirect_to tags_path
  end

  def explore 
    
  end

  private 
  def tags_params
    params.require(:tags).permit(:keyword)
  end
end
