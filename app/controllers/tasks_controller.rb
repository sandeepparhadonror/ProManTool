class TasksController < ApplicationController

	load_and_authorize_resource :project
	load_and_authorize_resource :task, through: :project
	before_action :set_project
	before_action :set_task

	
	def index
		@tasks = @project.tasks
	end

	def new
		@task = Task.new(project_id: @project.id)
	end

	def create
		@task = Task.new(task_params)
		if @task.save!
			redirect_to project_tasks_path, notice: "Successfully Added the Added" 
		else
			render :new
		end	
	end

	def edit
		@project = @task.project
	end	

	def update
		if @task.update(task_params)
			redirect_to project_tasks_path, notice: "Successfully Added the Added"	
		else
			render :edit
		end	
	end

	def destroy
		@task.destroy
		redirect_to project_tasks_path, notice: "Successfully deleted the Task"
	end

	private

	def task_params
		params.require(:task).permit(:name, :description, :due_date, :project_id, :user_id, :status)	
	end	

	def set_project
		@project = Project.find_by(id: params[:project_id])
	end

	def set_task
		@task = Task.find_by(id: params[:id])
	end	


end
