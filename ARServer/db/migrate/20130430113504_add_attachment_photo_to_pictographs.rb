class AddAttachmentPhotoToPictographs < ActiveRecord::Migration
  def self.up
    change_table :pictographs do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :pictographs, :photo
  end
end
