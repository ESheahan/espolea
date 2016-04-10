class Review < ActiveRecord::Base
  belongs_to  :user
  #To get reviews associated with this user
  scope :for_user, lambda { |user|
    where("user_id = ?", user.id)
  }
end
