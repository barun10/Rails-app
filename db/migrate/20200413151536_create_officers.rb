class CreateOfficers < ActiveRecord::Migration[5.2]
  def change
    create_table :officers do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
