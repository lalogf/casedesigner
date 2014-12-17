class AddAttachmentCaseToProducts < ActiveRecord::Migration
  def self.up
    change_table :products do |t|
      t.attachment :case
    end
  end

  def self.down
    remove_attachment :products, :case
  end
end
