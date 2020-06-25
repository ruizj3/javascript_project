class CreateTakedosages < ActiveRecord::Migration[6.0]
  def change
    create_table :takedosages do |t|
      t.date :datetaken
      t.references :prescription, null: false, foreign_key: true

      t.timestamps
    end
  end
end
