class User < ActiveRecord::Base
  has_many :events, through: :requests
  has_many :events
  has_many :requests
  has_many :evaluations

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  resourcify :has_one, role_cname: "Role"
end
