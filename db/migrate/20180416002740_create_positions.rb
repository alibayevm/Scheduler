class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.references :employee, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
