class Position < ApplicationRecord
  belongs_to :employee
  belongs_to :job
  validates :employee_id, uniqueness: { scope: :job_id}
end
