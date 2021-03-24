class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :payments

  validates :name, presence: true, length: { in: 4..32 }
  validates :icon, presence: true
end
