class DashboardController < ApplicationController
	
	
	def index
		@project = @user.projects
		projects_ids = @project.pluck(:id)
		@task =  Task.where(project_id: projects_ids )

	end

	def new
		@project = Project.new
	end

end
