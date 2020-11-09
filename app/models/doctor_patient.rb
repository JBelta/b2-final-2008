class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def self.remove(doctor, patient)
    patient = where(doctor_id: doctor, patient_id: patient).first
    patient.delete
  end
end
