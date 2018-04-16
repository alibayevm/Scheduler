class Timeslot < ApplicationRecord
  belongs_to :job
  has_one :reservedslot, :dependent => :destroy
  #self.reserved = false if self.reserved.nil?
  #validates :job_id, :uniqueness => {:scope => [:start_time, :day_of_week]}
end
