class Project < ApplicationRecord
resourcify
	belongs_to :user
	has_many :tasks

	enum status: [:inprogress, :completed]
	
end
