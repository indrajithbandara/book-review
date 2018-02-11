class AddAttachmentBookImageToBooks < ActiveRecord::Migration[5.1]
  def up
    change_table :books do |t|
      t.attachment :book_image
    end
  end

  def down
    remove_attachment :books, :book_image
  end
end
