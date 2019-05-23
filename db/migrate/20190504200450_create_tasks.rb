class CreateTasks < ActiveRecord::Migration[5.2]
	def change
		create_table :tasks do |t|

			t.string    :name
			t.string    :description
			t.integer   :status,   default: 0
			t.date    	:due_date

      t.belongs_to :project, index: true
      t.belongs_to :user,    index: true

			t.timestamps
		end
	end
end
