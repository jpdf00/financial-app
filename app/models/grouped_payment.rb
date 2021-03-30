class GroupedPayment < ApplicationRecord
  belongs_to :group, optional: true
  belongs_to :payment
end
