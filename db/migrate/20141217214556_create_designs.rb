class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      # t.string :description
      t.references :user

      t.timestamps
    end
  end
end
