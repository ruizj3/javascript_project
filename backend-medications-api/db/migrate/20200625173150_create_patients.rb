class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :username
      t.string :password
      t.date :dob
      t.string :ethnicity
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
