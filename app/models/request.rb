class Request < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  scope :pending, -> {where(status: 'pending')}
  scope :accepted, -> {where(status: 'accepted')}
  scope :rejected, -> {where(status: 'rejected')}
end
