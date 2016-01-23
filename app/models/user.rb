class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tag_users
  has_many :tags, through: :tag_users

  has_many :organization_users
  has_many :organizations, through: :organization_users
end
