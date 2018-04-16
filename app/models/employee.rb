class Employee < ApplicationRecord
  	belongs_to :user
  	has_many :positions, :dependent => :destroy
  	has_many :reservedslots, :dependent => :destroy
  	validates :first_name, presence: true
  	validates :last_name, presence: true
end
