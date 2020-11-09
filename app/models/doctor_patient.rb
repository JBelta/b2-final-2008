class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

    validates_presence_of :doctor_id, :patient_id

  def self.remove(doctor, patient)
    patient = where(doctor_id: doctor, patient_id: patient).first
    patient.delete
  end
end
