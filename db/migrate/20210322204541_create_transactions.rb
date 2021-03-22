class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :name, null: false
      t.decimal :amount, null: false
      t.references :author
      t.timestamps
    end
  end
end
