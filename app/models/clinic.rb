class Clinic < ActiveRecord::Base

  belongs_to :user
  has_many :schedules

  #For state filter
  scope :by_state, lambda { |state|
    where("state LIKE ?", "%#{state}%")
  }
  #For municipality filter
  scope :by_municipality, lambda { |municipality|
    where("municipality LIKE ?", "%#{municipality}%")
  }

end
