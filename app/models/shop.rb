class Shop < ActiveRecord::Base
    #belongs_to :user
    belongs_to :owner
    has_many :likes, dependent: :destroy
    has_many :shopimages, :inverse_of => :shop, dependent: :destroy
    accepts_nested_attributes_for :shopimages, allow_destroy: true
    has_many :menuimages, :inverse_of => :shop, dependent: :destroy
    accepts_nested_attributes_for :menuimages, allow_destroy: true
    has_many :messagerooms, dependent: :destroy
    has_many :messages, dependent: :destroy

    mount_uploader :image1, ImageUploader
    geocoded_by :address
    after_validation :geocode
end
