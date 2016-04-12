class Review < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :clinic
  #To get reviews associated with this user
  scope :for_user, lambda { |user|
    where("user_id = ?", user.id)
  }
  #To get reviews associated with the clinic
  scope :for_clinic, lambda{ |clinic|
    where("clinic_id = ?", user.id)
  }
end
