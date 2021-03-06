require "rails_helper"

describe "As a visitor" do
  describe "When I visit a doctors show page" do
    before :each do
      @hospital = Hospital.create!(name:"Grey Sloan Memorial Hospital")
      @doctor = @hospital.doctors.create!(name:"Meredith Grey", speciality:"General Surgery", university: "Harvard University" )
      @patient_1 = Patient.create!(name:"Katie Bryce", age:24 )
      @patient_2 = Patient.create!(name:"Denny Duquette", age:39 )
      DoctorPatient.create!(doctor_id: @doctor.id, patient_id: @patient_1.id)
      DoctorPatient.create!(doctor_id: @doctor.id, patient_id: @patient_2.id)
    end
    it "I see all of that doctors information including name, speciality, university as well as their hospital and list of patients" do
      visit "/doctors/#{@doctor.id}"

      expect(page).to have_content(@doctor.name)
      expect(page).to have_content(@doctor.speciality)
      expect(page).to have_content(@doctor.university)
      expect(page).to have_content(@hospital.name)

      within "#patient-#{@patient_1.id}" do
        expect(page).to have_content(@patient_1.name)
      end
      within "#patient-#{@patient_2.id}" do
        expect(page).to have_content(@patient_2.name)
      end
    end
    it "Next to each patient's name, I see a button to remove that patient from that doctors caseload." do
      visit "/doctors/#{@doctor.id}"

      within "#patient-#{@patient_1.id}" do
        expect(page).to have_button("Remove")
      end
      within "#patient-#{@patient_2.id}" do
        expect(page).to have_button("Remove")
      end
    end 
  end
end
