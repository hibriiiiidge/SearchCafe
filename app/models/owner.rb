class Owner < ActiveRecord::Base
  belongs_to :user
  has_many :shops, dependent: :destroy

end
