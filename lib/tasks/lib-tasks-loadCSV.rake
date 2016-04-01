require 'smarter_csv'
require 'date'


desc "Load CSV Clinics"
task :load_csv => :environment do

  canonClinics = SmarterCSV.process("#{Rails.root}/lib/tasks/clinics.csv")

  canonClinics.each do |canonClinic|
    clinic = Clinic.new
    clinic.name = canonClinic[:name]
    clinic.phone_number = canonClinic[:phone_number]
    clinic.email = canonClinic[:email]
    clinic.website = canonClinic[:website]
    clinic.state = canonClinic[:state]
    clinic.municipality = canonClinic[:municipality]
    clinic.latitude = canonClinic[:latitude]
    clinic.longitude = canonClinic[:longitude]
    
    #puts clinic
    clinic.save

  end

end