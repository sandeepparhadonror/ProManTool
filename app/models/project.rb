class Project < ApplicationRecord
resourcify
	belongs_to :owner, class_name: "User"
	has_many :tasks

	enum status: [:inprogress, :completed]
	
end
