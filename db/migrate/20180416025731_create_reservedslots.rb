class CreateReservedslots < ActiveRecord::Migration[5.1]
  def change
    create_table :reservedslots do |t|
      t.references :employee, foreign_key: true
      t.references :timeslot, foreign_key: true
      t.time :start_time
      t.string :day_of_week

      t.timestamps
    end
  end
end
