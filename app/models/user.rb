class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  with_options presence: true do
    { message: '空では登録できない' }
    validates :email, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/, message: 'は＠を含むこと。' }
    validates :password, format: { with: /\A(?=\d{0,99}+[a-z])(?=[a-z]{0,99}+\d)[a-z\d]{6,100}+\z/i, message: 'パスワードは6文字以上で半角英数字混合であること' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください。' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください。' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力して下さい。' }
    # validates :encrypted_password, format: { with: /\A[a-z0-9]+\z/i, message: "は半角英数で入力してください。"}
  end
end
