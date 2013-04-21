require_relative '../../db/config'
require 'faker'

class Teacher < ActiveRecord::Base
 
  validates :name, presence: true
  validates :email, email: true, uniqueness: true
  validates :phone, phone: true

  def name
    "#{first_name} #{last_name}"
  end

end