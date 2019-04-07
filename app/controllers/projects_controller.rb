class ProjectsController < ApplicationController

  before_action :set_project, only: [ :show, :edit, :update, :destroy]


  def index
    @projects = Project.all
  end

  def show

  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.start_date = Time.now.strftime("%d/%m/%Y")
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @project.update_attributes(project_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy

    @project.destroy
    redirect_to projects_path, success: 'Project was success deleted'
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :summary)
  end
end
