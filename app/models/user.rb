class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=\d{0,99}+[a-z])(?=[a-z]{0,99}+\d)[a-z\d]{6,100}+\z/i, message: 'Include both letters and numbers'} 

  has_many :items

  with_options presence: true do  
    validates :nickname
    validates :birthday
    validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください。' }
    validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
  end
end
