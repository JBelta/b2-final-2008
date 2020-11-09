Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# Doctors
  get "/doctors/:doctor_id", to: 'doctors#show'
  delete '/doctors/:doctor_id/patients/:patient_id', to: 'patients#destroy'
# Hospitals
  get '/hospitals/:hospital_id', to: 'hospitals#show'

# Patients
  #delete '/doctors/:doctor_id/patients/:patient_id', to: 'patients#destroy'

end
