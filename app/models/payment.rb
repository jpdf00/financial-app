class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :grouped_payments, foreign_key: :payment_id
  has_many :groups, through: :grouped_payments

  validates :name, presence: true, length: { in: 4..32 }
  validates :amount, numericality: true

  def grouped_payment_find(group)
    grouped_payments.find_by(group_id: group.id)
  end
end
