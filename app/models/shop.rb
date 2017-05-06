class Shop < ActiveRecord::Base
  #オーナーに属する
  belongs_to :owner
  #likesを持つ
  has_many :likes, dependent: :destroy
  #ショップイメージ
  has_many :shopimages, inverse_of: :shop, dependent: :destroy
  accepts_nested_attributes_for :shopimages, allow_destroy: true
  #メニューイメージ
  has_many :menuimages, inverse_of: :shop, dependent: :destroy
  accepts_nested_attributes_for :menuimages, allow_destroy: true
  #メッセージ
  has_many :messagerooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  #メインイメージ
  mount_uploader :image1, ImageUploader
  geocoded_by :address
  after_validation :geocode
end
