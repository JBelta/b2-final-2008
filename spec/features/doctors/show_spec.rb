require "rails_helper"

describe "As a visitor" do
  describe "When I visit a doctors show page" do
    before :each do
      @hospital = Hospital.create!(name:"Grey Sloan Memorial Hospital")
      @doctor = @hospitals.doctors.create!(name:"Meredith Grey", speciality:"General Surgery", university: "Harvard University" )
    end
    it "I see all of that doctors information including name, speciality, university" do
      visit "/doctors/#{@doctor.id}"

      ecpect(page).to have_content(@doctor.name)
      ecpect(page).to have_content(@doctor.speciality)
      ecpect(page).to have_content(@doctor.university)
    end
  end
end
