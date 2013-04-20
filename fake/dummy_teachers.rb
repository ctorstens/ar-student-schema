require_relative '../app/models/student'
require_relative '../app/models/teacher'
require 'faker'



def create_dummy_teachers(iters)
  iters.times do
    #create an object => Teacher.new
    #save the object => object.save
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = Faker::Internet.email
    Teacher.create(first_name: first_name, last_name: last_name, email: email )
  end
end

# create_dummy_teachers(1)
