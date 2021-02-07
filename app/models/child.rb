class Child < ApplicationRecord
    
  #Relationships 
  has_many :chores
  has_many :tasks, through: :chores

  #Validations
  validates_presence_of :first_name, :last_name
end
