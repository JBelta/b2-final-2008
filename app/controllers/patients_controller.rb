class PatientsController < ApplicationController
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    DoctorPatient.remove(params[:doctor_id], params[:patient_id])
    redirect_to "/doctors/#{@doctor.id}"
  end
end
