class Area < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum facilities: {コンビニ:0, ショッピング:1, 飲食店:2, 公園:3, その他:4}

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :area_comments, dependent: :destroy

  validates :area_name, presence: true
  validates :address, presence: true
  validates :facilities, presence: true
  validates :open_time, presence: true
  validates :close_time, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.search(search)
    if search
      Area.where(['content LIKE ?', "%#{search}%"])
    else
      Area.all
    end
  end
end
