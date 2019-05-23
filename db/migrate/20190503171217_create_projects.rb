class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      
      t.string  :project_name
      t.string  :project_type
      t.text    :project_description
      t.integer :status,   default: 0 
      t.belongs_to :user, index: true 
      t.timestamps
    end
  end
end
