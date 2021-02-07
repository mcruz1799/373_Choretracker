class Chore < ApplicationRecord
  #Relationships
  belongs_to :child
  belongs_to :task
end
