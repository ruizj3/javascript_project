class CreateBankaccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bankaccounts do |t|
      t.float :balance
      t.string :currency
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
