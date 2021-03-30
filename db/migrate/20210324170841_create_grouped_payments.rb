class CreateGroupedPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :grouped_payments do |t|
      t.references :payment
      t.references :group
      t.timestamps
    end
  end
end
