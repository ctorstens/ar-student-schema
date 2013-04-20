require 'rspec'
require 'date'
require_relative '../app/models/teacher'


describe Teacher, "unique emails" do

  before(:all) do
    @teacher = Teacher.new( first_name: "Chris",
                            last_name: "Parker",
                            email: "cparke14werwefasdfasdfq3fefqwfr@example.com" )
  end
  
  it "should allow users with unique emails to be added" do
    @teacher.should be_valid
  end

  it "should reject users with pre-existing emails from being added" do
    @teacher.email = Teacher.all.first.email
    @teacher.should_not be_valid
  end
end
