class CreateGroupedTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :grouped_transactions, id: false do |t|
      t.references :assembly
      t.references :part
    end
  end
end
