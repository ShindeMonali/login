class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :mode
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :level

      t.timestamps
    end
  end
end
