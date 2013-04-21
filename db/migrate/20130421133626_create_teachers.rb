require_relative '../config'

class CreateTeachers < ActiveRecord::Migration

  def change
    create_table :teachers do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
    end

  end


end