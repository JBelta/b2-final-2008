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
    it "When I click on the button to remove a patient, I am returned to the doctors show page and no longer see that patients name." do
      visit "/doctors/#{@doctor.id}"

      within "#patient-#{@patient_1.id}" do
        expect(page).to have_button("Remove")
        click_button "Remove"
      end

      expect(current_path).to eq("/doctors/#{@doctor.id}")
      expect(page).to_not have_css("#patient-#{@patient_1.id}")
      expect(page).to_not have_content(@patient_1.name)
    end
  end
end
