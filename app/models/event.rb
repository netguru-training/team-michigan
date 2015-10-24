class Event < ActiveRecord::Base
  has_many :requests
end
