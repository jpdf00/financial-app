class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :authored_payments, foreign_key: :author_id, class_name: 'Payment', dependent: :destroy
  has_many :groups, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :name, presence: true, length: { in: 4..32 }
  validates :password, presence: true, length: { minimum: 8 }
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  def grouped
    authored_payments.joins(:grouped_payments)
      .order('name DESC')
      .where('grouped_payments.group_id >= 1')
      .group('payments.id')
  end

  def ungrouped
    authored_payments.includes(:grouped_payments).order('name DESC').map do |payment|
      payment if payment.grouped_payments.empty?
    end.compact
  end
end
