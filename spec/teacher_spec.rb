require 'rspec'
require 'date'
require_relative '../app/models/teacher'

describe Teacher, "validations" do

  before(:all) do 
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers).should be_true
    Teacher.delete_all
  end

  before(:each) do 
    @teacher = Teacher.create({
      :first_name => "Jane",
      :last_name => "Smith",
      :email => "jsmith@example.com",
      :phone => "123.456.7890"
    })
  end

  it "should have a name method" do
    [:name].each { |mthd| @teacher.should respond_to mthd }
  end

  it "shouldn't allow redundant email addresses" do
    @teacher_2 = Teacher.create({
      :first_name => "John",
      :last_name => "Smith",
      :email => "jsmith@example.com",
      :phone => "123.456.7890"
    })
    @teacher_2.should_not be_valid
    end

end