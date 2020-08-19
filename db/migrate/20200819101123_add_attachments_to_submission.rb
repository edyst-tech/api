class AddAttachmentsToSubmission < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :attachments, :text, array: true, default: []
  end
end
