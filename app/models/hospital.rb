class Hospital < ApplicationRecord
  has_many :doctors

  validates_presence_of :name

  def number_of_doctors
    doctors.count
  end

end
