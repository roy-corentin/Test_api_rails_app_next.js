class CreateBenevoles < ActiveRecord::Migration[6.1]
  def change
    create_table :benevoles do |t|
      t.string :firstName
      t.string :lastName
      t.string :email

      t.timestamps
    end
  end
end
