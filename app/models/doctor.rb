class Doctor < ApplicationRecord
  belongs_to :hospital

  def works_at
    hospital.name
  end
end
