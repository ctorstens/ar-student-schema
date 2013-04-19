require_relative '../../db/config'

# implement your Student model here


class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not a valid email")
    end
  end
end

class AgeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value >= 5 
      record.errors[attribute] << (options[:message] || "the student is too young")
    end
  end
end

class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.scan(/\d/).length >= 10
      record.errors[attribute] << (options[:message] || "not enough numbers")
    end
  end
end

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


