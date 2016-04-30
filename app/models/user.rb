class User < ActiveRecord::Base
  has_many :clinics
  has_many :reviews
  has_one :info

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name()
    if self.first_name and self.last_name
        return self.first_name + " " + self.last_name 
    elsif self.first_name
        return self.first_name
    elsif self.last_name
        return self.last_name
    else
        return ""
    end
  end

end
