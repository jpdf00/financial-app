class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name, null: false
      t.string :icon, null: false
      t.references :user
      t.timestamps
    end
  end
end
