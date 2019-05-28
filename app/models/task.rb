class Task < ApplicationRecord
	resourcify

	belongs_to :project
	
	belongs_to :owner, class_name: "User"
	has_many :user_task, foreign_key: "assigned_task_id"
	has_many :assigned_users, through: :user_tasks


	enum status: [:inprogress, :completed]

end
