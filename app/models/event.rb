class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  validates :start_time, :end_time, :overlap => {:exclude_edges => ["start_time", "end_time"]}

  validate :start_time_not_in_the_past
  
    def start_time_not_in_the_past
      if start_time.present? && start_time < Date.today
        errors.add(:start_time, "can't be in the past")
      end
    end 
end
