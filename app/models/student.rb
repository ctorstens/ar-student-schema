require_relative '../../db/config'

# implement your Student model here

class Student < ActiveRecord::Base
 
  validates :email, :email => true, :uniqueness => true
  validates :age, :age => true
  validates :phone, :phone => true
  
  def name
    "#{first_name} #{last_name}"
  end

  def age
    today = DateTime.now
    today.year - birthday.year - ((today.month > birthday.month || (today.day > birthday.day && today.month == birthday.month)) ? 0 : 1)
  end

end


