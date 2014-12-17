class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :model
      t.references :user

      t.timestamps
    end
  end
end
