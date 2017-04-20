class Shopimage < ActiveRecord::Base
  belongs_to :shop
  mount_uploader :image, ImageUploader
end
