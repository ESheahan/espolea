class Clinic < ActiveRecord::Base

  belongs_to :user
  has_many :schedules
  
  #Required fields for possible filters
  validates :name, presence: true
  validates :state, presence: true
  validates :municipality, presence: true
  #For state filter
  scope :by_state, lambda { |state|
    where("state LIKE ?", "%#{state}%")
  }
  #For municipality filter
  scope :by_municipality, lambda { |municipality|
    where("municipality LIKE ?", "%#{municipality}%")
  }
  #For name filter
  scope :by_name, lambda { |name|
    where("name LIKE ?", "%#{name}%")
  }

end
