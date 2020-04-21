class CreateOfficers < ActiveRecord::Migration[5.2]
  def change
    create_table :officers do |t|
      t.string :name, null: false, unique: true

      t.string :email, null: false, unique: true

      t.timestamps
    end
  end
end
