class Message < ActiveRecord::Base
  belongs_to :organization
  has_many :message_tags
  has_many :tags, through: :message_tags
end
