json.array!(@clinics) do |clinic|
  json.extract! clinic, :id, :name, :phone_number, :email, :website, :state, :municipality
  json.url clinic_url(clinic, format: :json)
end
