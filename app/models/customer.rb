class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  #  :validatable 消しました。uploadの際にパスワード変更ない為。
  has_many :orders, dependent: :destroy
  has_many :cart_products, dependent: :destroy
  has_many :address_lists, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true

  validates :encrypted_password, presence: true, on: :create
  #   on: :create追加。uploadの際にパスワード変更ない為、バリデーション引っかからないように。

  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true, uniqueness: true

  acts_as_paranoid


  def Customer.search(range,word)
        if range == "1"
           @customer = Customer.where(['last_name LIKE ? OR first_name LIKE ? OR last_name_kana LIKE ? OR first_name_kana LIKE ?', "%#{word}%","%#{word}%", "%#{word}%", "%#{word}%"])
        else
           @customer = Customer.all
        end
  end

end