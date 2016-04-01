class Clinic < ActiveRecord::Base
  #For state filter
  scope :by_state, lambda { |state|
    where("state LIKE ?", "%#{state}%")
  }
  #For municipality filter
  scope :by_municipality, lambda { |municipality|
    where("municipality LIKE ?", "%#{municipality}%")
  }
end
