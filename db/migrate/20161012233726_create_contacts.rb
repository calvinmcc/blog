class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
