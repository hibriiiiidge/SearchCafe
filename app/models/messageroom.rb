class Messageroom < ActiveRecord::Base
  belongs_to :shop
  belongs_to :user
  has_many :messages, :inverse_of => :messageroom, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true
end
