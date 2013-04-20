require 'active_record'
ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-students.sqlite3")




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
