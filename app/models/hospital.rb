class Hospital < ApplicationRecord
  has_many :doctors

  def number_of_doctors
    doctors.count
  end
  
end
