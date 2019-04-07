class TasksController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    
    redirect_to project_path(@project)
  end

  def update
    if @project.update_attributes(task_params)
      redirect_to project_path(@project), success: 'Task was success updated'
    else
      render :edit, danger: 'Task was not updated'
    end
  end



  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to project_path(@project)
  end

  private
  def task_params
    params.require(:task).permit(:title, :description)
  end

end
