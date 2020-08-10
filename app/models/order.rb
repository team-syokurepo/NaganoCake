class Order < ApplicationRecord
	belongs_to :customer
	has_many :product_orders, dependent: :destroy
	validates :name, presence: true
    validates :postal_code, presence: true
    validates :address, presence: true


	enum status:{
		入金待ち: 0,
		入金確認: 1,
		制作中: 2,
		発送準備中: 3,
		発送済み: 4
	}

	enum how_to_pay:{ クレジットカード支払い: 0, 銀行振込: 1}

end
