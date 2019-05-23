class ProjectsController < ApplicationController

	load_and_authorize_resource param_method: :projects_params
	before_action :set_project, only: [:show, :edit, :update, :destroy]


	def index
		@project = Project.all 
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(projects_params)
		#@project.user = @user
		if @project.save!
			redirect_to projects_path, notice: "Successfully added the project"
		else
			render :new
		end	
	end	

	def show
	end

	def edit
	end

	def update
		if @project.update(projects_params)
			redirect_to projects_path, notice: "Successfully update the project" 
		else
			render :edit
		end	
	end	

	def destroy
		@project.destroy
		redirect_to projects_path, notice: "Project as Successfully deleted"	
	end


	private

	def projects_params
		params.require(:project).permit(:project_name, :project_type, :project_description, :user_id, :status)
	end

	def set_project
		if params[:id]
			@project = Project.find_by(id: params[:id])
		else
			@project = Project.find_by(id: params[:project_id])
		end
	end	


end
