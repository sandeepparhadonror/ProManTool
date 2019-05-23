class UserTask < ApplicationRecord

	belongs_to :assigned_user, class_name: "User"
	belongs_to :assigned_task, class_name: "Task"

end
