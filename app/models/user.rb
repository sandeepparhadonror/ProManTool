class User < ApplicationRecord
	rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many  :projects, foreign_key: "owner_id"
  has_many :user_projects, foreign_key: "collaborator_id"
  has_many :collaboration_projects, through: :user_projects

  has_many :tasks, foreign_key: "owner_id"
  has_many :user_tasks, foreign_key: "assigned_user_id"
  has_many :assigned_tasks, through: :user_tasks

end
