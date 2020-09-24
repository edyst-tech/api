class AddAttachmentsToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :attachments, :json, default: []
  end
end
