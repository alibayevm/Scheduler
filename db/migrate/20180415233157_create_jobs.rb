class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.float :pay_rate
      t.string :schedule_type

      t.timestamps
    end
  end
end
