class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :areas, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :area_comments, dependent: :destroy

end