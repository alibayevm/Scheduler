class CreateTimeslots < ActiveRecord::Migration[5.1]
  def change
    create_table :timeslots do |t|
      t.references :job, foreign_key: true
      t.time :start_time
      t.string :day_of_week
      t.boolean :reserved

      t.timestamps
    end
  end
end
