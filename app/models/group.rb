class Group < ApplicationRecord
  belongs_to :user
  has_many :grouped_payments, foreign_key: :payment_id
  has_many :payments, through: :grouped_payments

  validates :name, presence: true, length: { in: 4..32 }
  validates :icon, presence: true
end
