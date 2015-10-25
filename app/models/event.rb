class Event < ActiveRecord::Base
  has_many :requests
  has_many :users, through: :requests
  has_many :evaluations
  belongs_to :user

  def students
    self.users
  end

  def teacher
    self.user
  end
end
