class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :name
      t.decimal :amount
      t.references :author
      t.timestamps
    end
  end
end
