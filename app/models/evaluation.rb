class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :reading, inclusion: 1..10
  validates :writing, inclusion: 1..10
  validates :listening, inclusion: 1..10
end
