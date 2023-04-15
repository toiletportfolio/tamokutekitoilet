class Area < ApplicationRecord

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  enum facilities: {コンビニ:0, ショッピング:1, 飲食店:2, 公園:3, その他:4}

  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :area_comments, dependent: :destroy
end
