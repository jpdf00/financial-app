class CreateGroupsPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :groups_payments, id: false do |t|
      t.references :payment
      t.references :group
    end
  end
end
