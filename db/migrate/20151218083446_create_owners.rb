class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.references :user, index: true, foreign_key: true
      t.string :last_name
      t.string :first_name
      t.string :company_name
      t.string :company_address
      t.string :company_tel

      t.timestamps null: false
    end
  end
end
