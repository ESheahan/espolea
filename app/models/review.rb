class Review < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :clinic
  #To get reviews associated with the clinic
  scope :for_clinic, lambda{ |clinic|
    where("clinic_id = ?", user.id)
  }
end
