class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @project.tags.build
    
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      manage_tags
      if(!params[:project][:timeline].empty?)
        input_timeline = params.require(:project).permit(timeline: [:lifecycle])
        @project.timelines << Timeline.where('lifecycle = ?', input_timeline[:timeline][:lifecycle])
      end
      
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find(params[:id])
  end
  
  def update
  @project = Project.find(params[:id])
  if @project.update(project_params)
    tag = params.require(:project).permit(tag: [:keyword])
    @project.tags.update(tag)
    redirect_to @project
  else
    render 'edit'
  end
end
  
  def show

    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    redirect_to projects_path
  end
  
  def index
   
    if params[:tag]
      @projects = Project.tagged_with(params[:tag])
    else
      @projects = Project.search(params[:search])
       #byebug
      # @projects = Project.all
    end
  end

  private
  
  def manage_tags
    
    tag = params.require(:project).permit(tag: [:keyword])
    if(Tag.where("keyword = ?", tag[:tag][:keyword]).empty?)
      @project.tags.create(tag[:tag])
    else
      @project.tags << Tag.where("keyword = ?", tag[:tag][:keyword])
    end
  end
  
  def project_params
    params.require(:project).permit(:name, :description, :link, tags: [:keyword], timelimes: [:lifecycle])
  end
  
end
