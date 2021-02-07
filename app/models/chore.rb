class Chore < ApplicationRecord
  #Relationships
  belongs_to :child
  belongs_to :task

  #Validations
  validates_timeliness_of :due_on

  #Scopes
  scope :by_task,       -> { joins(:task).order('name')}
  scope :chronological, -> { order(:due_on)}
  scope :pending,       -> { where(completed: false)}
  scope :done,          -> { where(completed: true)}
  scope :upcoming,      -> { where("due_on >= ?", Date.current)}
  scope :past,          -> { where("due_on < ?", Date.current)}

  #Method
  def status
    return "Completed" if self.completed
    return "Pending"
  end

end
