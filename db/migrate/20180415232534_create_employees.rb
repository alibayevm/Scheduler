class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
