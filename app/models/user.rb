class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :Books
   attachment :profile_image
   # プロフィールイメージのコントローラー書いてない

   validates :name, presence: true, length: { in: 2..20 }

end
