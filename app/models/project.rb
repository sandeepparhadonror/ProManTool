class Project < ApplicationRecord
resourcify
	belongs_to :owner, class_name: "User"
	has_many :tasks

	has_many :user_projects, foreign_key: "collaboration_project_id"
	has_many :collaborators, through: :user_projects

	enum status: [:inprogress, :completed]
	
end
