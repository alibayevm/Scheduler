class Job < ApplicationRecord
	has_many :positions, :dependent => :destroy
	has_many :timeslots, :dependent => :destroy
	validates :title, presence: true
	validates :pay_rate, presence: true
	validates :schedule_type, presence: true
end
