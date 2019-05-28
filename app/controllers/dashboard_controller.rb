class DashboardController < ApplicationController
	
	
	def index
		@project = @user.projects
		@task = @project.joins(:tasks)
		#@task = Task.where(project_id: @project.ids)

	end

	def new
		@project = Project.new
	end

end
