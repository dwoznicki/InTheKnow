class MessageTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :message
end
