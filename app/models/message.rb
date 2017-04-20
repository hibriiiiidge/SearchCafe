class Message < ActiveRecord::Base
  belongs_to :messageroom
  belongs_to :user
  belongs_to :shop
end
