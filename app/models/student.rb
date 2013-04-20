require_relative '../../db/config'

# implement your Student model here





class Student < ActiveRecord::Base
  validates :email, :email => true, :uniqueness => true
  validates :age, :age => true
  validates :phone, :phone => true

  belongs_to :teacher
  def name
    "#{first_name} #{last_name}"
  end

  def name=(name)
    self.first_name, self.last_name = name.split(' ')
  end

  def age
    today = DateTime.now
    today.year - birthday.year - ((today.month > birthday.month || (today.day > birthday.day && today.month == birthday.month)) ? 0 : 1)
  end
end


