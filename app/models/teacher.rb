require_relative '../../db/config'

# implement your Teacher model here





class Teacher < ActiveRecord::Base
  validates :email, :email => true, :uniqueness => true
  validates :phone, :phone => true

  has_many :student
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


#  teacher = Teacher.new( first_name: "June",
#                             last_name: "Parker",
#                             email: "jparker@email.com" )


# teacher.save
# p teacher
# teacher.delete
# p teacher


p Teacher.where("id = ?", 2)
