class UserProject < ApplicationRecord

belongs_to :collaborators, class_name: "User"
belongs_to :collaboration_projects, class_name: "Project"


end
