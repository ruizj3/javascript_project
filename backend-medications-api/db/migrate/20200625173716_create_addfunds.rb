class CreateAddfunds < ActiveRecord::Migration[6.0]
  def change
    create_table :addfunds do |t|
      t.float :amount
      t.date :addeddate
      t.references :bankaccount, null: false, foreign_key: true

      t.timestamps
    end
  end
end
