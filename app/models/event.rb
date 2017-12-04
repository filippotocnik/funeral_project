class Event < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :start_time, presence: true
  validates :start_time, :end_time, :overlap => {:exclude_edges => ["start_time", "end_time"]}
end
