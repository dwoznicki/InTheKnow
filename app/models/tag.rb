class Tag < ActiveRecord::Base

  has_many :tag_users
  has_many :users, through: :tag_users
  has_many :message_tags
  has_many :messages, through: :message_tags
end
