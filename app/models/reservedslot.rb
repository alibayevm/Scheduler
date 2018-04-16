class Reservedslot < ApplicationRecord
  belongs_to :employee
  belongs_to :timeslot
  validates :employee_id, :uniqueness => {:scope => [:start_time, :day_of_week]}
  validates :timeslot_id, uniqueness: true
end
