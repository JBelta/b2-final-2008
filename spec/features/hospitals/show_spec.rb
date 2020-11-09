require "rails_helper"

describe "As a visitor" do
  describe "When I visit a hospitals show page" do
    before :each do
      @hospital = Hospital.create!(name:"Grey Sloan Memorial Hospital")
      @doctor_1 = @hospital.doctors.create!(name:"Meredith Grey", speciality:"General Surgery", university: "Harvard University" )
      @doctor_2 = @hospital.doctors.create!(name:"Alex Karev Specialty", speciality:"Pediatric Surgery", university: "Johns Hopkins University" )
    end
    it "I see the hospitals name, the number of doctors the hospital has, and the universities attended by the doctors" do
      visit "/hospitals/#{@hospital.id}"

      expect(page).to have_content(@hospital.name)
      expect(page).to have_content("Doctors on Staff: 2")
      expect(page).to have_content(@doctor_1.university)
      expect(page).to have_content(@doctor_2.university)
    end
  end
end
