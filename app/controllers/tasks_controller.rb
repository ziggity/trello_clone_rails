class TasksController < ApplicationController
    before_action :set_project

    def create
      @task = @project.task.create(task_params)
      redirect_to @project 
    end
    def destroy
        @task = @project.tasks.find(params[:id])
        if @task.destroy
            flash[:success] = "task was deleted."
        else
            flash[:error] = "task was not deleted"
        end
    end

    private 

    def set_project
      @project = Project.find(params[:project_id])
    end

    def task_params
        params[:task].permit(:content)
    end

end
