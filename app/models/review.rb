class Review < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :clinic
  validates_presence_of :title, :body
  
  scope :recent, -> {
    order("created_at DESC").limit(4)
  }
end
