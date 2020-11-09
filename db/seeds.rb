# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DoctorPatient.delete_all
Patient.delete_all
Doctor.delete_all
Hospital.delete_all

# Hospitals ---
@hospital = Hospital.create!(name:"Grey Sloan Memorial Hospital")

#Doctors --
@meredith = @hospital.doctors.create!(name:"Meredith Grey", speciality:"General Surgery", university: "Harvard University" )

@alex = @hospital.doctors.create!(name:"Alex Karev Specialty", speciality:"Pediatric Surgery", university: "Johns Hopkins University" )

#Patients --
@katie = Patient.create!(name:"Katie Bryce", age:24 )
@denny = Patient.create!(name:"Denny Duquette", age:39 )
@zola = Patient.create!(name:"Zola Shepherd", age:2 )

#Roster "DoctorPatient" ---
DoctorPatient.create!(doctor_id: @meredith.id, patient_id: @katie.id)
DoctorPatient.create!(doctor_id: @meredith.id, patient_id: @denny.id)
DoctorPatient.create!(doctor_id: @alex.id, patient_id: @zola.id)
