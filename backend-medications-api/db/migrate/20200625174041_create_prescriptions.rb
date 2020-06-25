class CreatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.number :dosagestotal
      t.number :dosagesper
      t.string :dosagesfrequency
      t.references :patient, null: false, foreign_key: true
      t.references :medication, null: false, foreign_key: true

      t.timestamps
    end
  end
end
