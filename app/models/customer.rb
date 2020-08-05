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

  acts_as_paranoid


end