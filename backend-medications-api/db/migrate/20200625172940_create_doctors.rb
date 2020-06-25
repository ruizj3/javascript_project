class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
