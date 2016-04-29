class Review < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :clinic
  validates_presence_of :title, :body
  before_save :calc_helpfulness, :calc_amounts
  
  scope :recent, -> {
    order("created_at DESC").limit(4)
  }

  def calc_helpfulness
      hful = self.helpful_list_id.length
      uhful = self.unhelpful_list_id.length

      if hful == 0 and uhful == 0
          self.percent_helpful = 0.0
      else
          self.percent_helpful = hful / (hful + uhful)
      end
  end

  def calc_amounts
      if self.helpful_list_id 
        self.helpful = self.helpful_list_id.length
      end

      if self.unhelpful_list_id
        self.unhelpful = self.unhelpful_list_id.length
      end
  end

  def total_ratings
      if self.helpful and self.unhelpful
        return self.helpful + self.unhelpful
      end
  end

  def user_voted(user_id)
      if self.helpful_list_id and self.helpful_list_id.include? user_id
          return 1
      elsif self.unhelpful_list_id and self.unhelpful_list_id.include? user_id
          return -1
      else
          return 0
      end
  end
end
