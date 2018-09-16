class Restaurant < ApplicationRecord
  validates_presence_of :name, :category, :tel, :address, :opening_hours, :description, :image
  mount_uploader :image, PhotoUploader
  belongs_to :category, optional: true

  # 當 Restaurant 物件被刪除時，順便刪除依賴的 Comment
  has_many :comments, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  
  def is_favorited?(user)
    self.favorited_users.include?(user)
  end
  
end
